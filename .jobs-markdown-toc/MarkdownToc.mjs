// Created by Jobs on 2026年10月18日，星期日.
// Git filters keep Typora's source token local and store a generated disclosure.
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { execFileSync, spawnSync } from 'node:child_process';

export const START = '<!-- jobs-toc:start -->';
export const END = '<!-- jobs-toc:end -->';
const DRIVER = 'jobs-markdown-toc';
const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const SCRIPT = path.relative(ROOT, fileURLToPath(import.meta.url)).split(path.sep).join('/');
const MANIFEST = '.jobs-markdown-toc/manifest.json';
const HEADING_END = '</span><!-- jobs-toc:heading-end -->';
const KEYS = ['clean', 'smudge', 'required'].map(key => `filter.${DRIVER}.${key}`);

function linesOf(source) {
  return [...source.matchAll(/[^\n]*(?:\n|$)/g)]
    .filter(match => match[0].length)
    .map(match => ({ text: match[0].replace(/\r?\n$/, ''), start: match.index,
      end: match.index + match[0].replace(/\r?\n$/, '').length }));
}

// Only top-level prose is inspected; examples must never become live TOC markers.
function scan(source) {
  const events = [];
  const lines = linesOf(source);
  let fence = null;
  let comment = false;
  let rawTag = null;
  let frontmatter = false;
  let previous = null;
  for (let index = 0; index < lines.length; index++) {
    let line = lines[index];
    let text = line.text;
    if (index === 0 && text.startsWith('\uFEFF')) {
      text = text.slice(1);
      line = { ...line, start: line.start + 1 };
    }
    if (index === 0 && text === '---') {
      frontmatter = true;
      continue;
    }
    if (frontmatter) {
      if (/^(---|\.\.\.)\s*$/.test(text)) frontmatter = false;
      continue;
    }
    if (rawTag) {
      if (new RegExp(`</${rawTag}\\s*>`, 'i').test(text)) rawTag = null;
      continue;
    }
    const fenced = text.match(/^ {0,3}(`{3,}|~{3,})(.*)$/);
    if (fence) {
      if (fenced && fenced[1][0] === fence[0] && fenced[1].length >= fence.length && !fenced[2].trim()) fence = null;
      continue;
    }
    if (fenced && !(fenced[1][0] === '`' && fenced[2].includes('`'))) {
      fence = fenced[1];
      previous = null;
      continue;
    }
    if (/^(?: {4}|\t)/.test(text)) {
      previous = null;
      continue;
    }
    if (!comment && (text === START || text === END || /^ {0,3}\[toc\][ \t]*$/i.test(text))) {
      events.push({ ...line, kind: text === START ? 'start' : text === END ? 'end' : 'toc' });
      previous = null;
      continue;
    }
    const raw = text.match(/^ {0,3}<(pre|script|style|textarea)(?:\s|>)/i);
    if (raw && !comment) {
      if (!new RegExp(`</${raw[1]}\\s*>`, 'i').test(text)) rawTag = raw[1];
      previous = null;
      continue;
    }
    // Strip comments before looking for headings, including multi-line comments.
    let visible = '';
    while (text.length) {
      if (comment) {
        const close = text.indexOf('-->');
        if (close < 0) break;
        text = text.slice(close + 3);
        comment = false;
      } else {
        const open = text.indexOf('<!--');
        visible += open < 0 ? text : text.slice(0, open);
        if (open < 0) break;
        text = text.slice(open + 4);
        comment = true;
      }
    }
    const heading = visible.match(/^ {0,3}(#{1,6})(?:[ \t]+(.*)|[ \t]*)$/);
    if (heading) {
      events.push({ ...line, kind: 'heading', level: heading[1].length,
        raw: (heading[2] ?? '').replace(/[ \t]+#+[ \t]*$/, '').trim() });
      previous = null;
    } else if (previous && /^ {0,3}(=+|-+)[ \t]*$/.test(visible)) {
      events.push({ ...previous, kind: 'heading', level: visible.trim()[0] === '=' ? 1 : 2, raw: previous.raw });
      previous = null;
    } else {
      previous = visible.trim() && !/^ {0,3}(?:>|[-+*] |\d+[.)] )/.test(visible) &&
        (!/^ {0,3}</.test(visible) || /^ {0,3}<(?:span|a|strong|b|font)\b/.test(visible))
        ? { ...line, raw: visible.trim() } : null;
    }
  }
  return events;
}

function sourceForm(source) {
  const events = scan(source);
  const markers = events.filter(event => event.kind === 'start' || event.kind === 'end');
  if (!markers.length) return source;
  if (markers.length % 2 || markers.some((marker, index) => marker.kind !== (index % 2 ? 'end' : 'start'))) {
    throw new Error('目录标记不完整或重复；请保留成对的 jobs-toc:start / jobs-toc:end。');
  }
  const edits = [];
  let version2 = false;
  for (let index = 0; index < markers.length; index += 2) {
    let body = source.slice(markers[index].end, markers[index + 1].start).trim();
    let token = '[toc]';
    const metadata = body.match(/^<!-- jobs-toc:source (.+) -->\r?\n/);
    if (metadata) {
      const value = JSON.parse(metadata[1]);
      if (value.v !== 2 || !/^ {0,3}\[toc\][ \t]*$/i.test(value.token)) throw new Error('目录源标记无效。');
      token = value.token;
      body = body.slice(metadata[0].length);
      version2 = true;
    }
    if (!body.startsWith('<details>') || !body.endsWith('</details>')) throw new Error('生成目录块结构异常，已停止转换。');
    edits.push({ start: markers[index].start, end: markers[index + 1].end, text: token });
  }
  if (version2) {
    for (const heading of events.filter(event => event.kind === 'heading')) {
      const line = source.slice(heading.start, heading.end);
      const open = line.match(/<span id="jobs-toc-heading-\d+" data-jobs-toc="v2">/g) ?? [];
      const close = line.split(HEADING_END).length - 1;
      if (!open.length && !close) continue;
      if (open.length !== 1 || close !== 1) throw new Error('自动标题锚点不完整，已停止恢复。');
      edits.push({ start: heading.start, end: heading.end, text: line.replace(open[0], '').replace(HEADING_END, '') });
    }
  }
  return applyEdits(source, edits);
}

function applyEdits(source, edits) {
  for (const edit of edits.sort((a, b) => b.start - a.start)) source = source.slice(0, edit.start) + edit.text + source.slice(edit.end);
  return source;
}

function stripLinks(value) {
  // A link label can itself contain brackets, as in CDN[-] / GitHub[+].
  let result = '';
  for (let index = 0; index < value.length;) {
    const image = value[index] === '!' && value[index + 1] === '[';
    const start = index + (image ? 1 : 0);
    if (value[start] !== '[') { result += value[index++]; continue; }
    let depth = 1;
    let end = start + 1;
    for (; end < value.length && depth; end++) {
      if (value[end] === '\\') { end++; continue; }
      if (value[end] === '[') depth++;
      if (value[end] === ']') depth--;
    }
    if (depth || !['(', '['].includes(value[end])) { result += value[index++]; continue; }
    const opener = value[end];
    const closer = opener === '(' ? ')' : ']';
    let tail = end + 1;
    depth = 1;
    for (; tail < value.length && depth; tail++) {
      if (value[tail] === '\\') { tail++; continue; }
      if (value[tail] === opener) depth++;
      if (value[tail] === closer) depth--;
    }
    if (depth) { result += value[index++]; continue; }
    result += stripLinks(value.slice(start + 1, end - 1));
    index = tail;
  }
  return result;
}

function decodeEntities(value) {
  const entities = { amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", nbsp: '\u00a0', copy: '©', reg: '®' };
  return value.replace(/&(#x[\da-f]+|#\d+|[a-z]+);/gi, (all, name) => {
    if (name[0] !== '#') return entities[name.toLowerCase()] ?? all;
    const code = name[1].toLowerCase() === 'x' ? parseInt(name.slice(2), 16) : Number(name.slice(1));
    return code > 0 && code <= 0x10ffff && !(code >= 0xd800 && code <= 0xdfff) ? String.fromCodePoint(code) : '\uFFFD';
  });
}

function inlineText(raw) {
  const protectedText = [];
  const protect = text => `\uE000${protectedText.push(text) - 1}\uE001`;
  return decodeEntities(stripLinks(raw
    .replace(/\\([!"#$%&'()*+,\-./:;<=>?@[\]\\^_`{|}~])/g, (_, text) => protect(text))
    .replace(/(`+)([\s\S]*?)\1/g, (_, ticks, text) => protect(text.replace(/\s+/g, ' ')))
    .replace(/<(https?:\/\/[^<>\s]+)>/g, '$1')
    .replace(/<[^>]*>/g, ''))
    .replace(/(\*\*|__|~~)(?=\S)([\s\S]*?\S)\1/g, '$2')
    .replace(/(?<![\p{L}\p{N}])([*_])(?=\S)(.*?\S)\1(?![\p{L}\p{N}])/gu, '$2')
    .replace(/\uE000(\d+)\uE001/g, (_, index) => protectedText[Number(index)])).trim();
}

function headingEntries(source) {
  const headings = scan(source).filter(event => event.kind === 'heading' && event.level >= 2);
  const explicit = headings.map(heading => [...heading.raw.matchAll(/<(span|a|strong|b)\b[^>]*\s(?:id|name)=(?:"([^"]+)"|'([^']+)'|([^\s>]+))[^>]*>([\s\S]*?)<\/\1>/gi)]
    .find(match => inlineText(match[5]).length));
  const ids = explicit.map(match => match ? decodeEntities(match[2] ?? match[3] ?? match[4]) : null);
  const documentIds = [...source.matchAll(/<[a-z][^>]*\s(?:id|name)=(?:"([^"]+)"|'([^']+)'|([^\s>]+))/gi)]
    .map(match => decodeEntities(match[1] ?? match[2] ?? match[3]));
  const edits = [];
  const entries = headings.map((heading, index) => {
    const raw = heading.raw.replace(/<a\b[^>]*href=["']#(?:前言|🔚)["'][^>]*>\s*(?:<b>)?\s*[🔼🔽]\s*(?:<\/b>)?\s*<\/a>/gu, '').trim();
    const title = inlineText(raw);
    let target = ids[index];
    if (!title) return null;
    if (!target || documentIds.filter(id => id === target).length !== 1) {
      target = `jobs-toc-heading-${index + 1}`;
      if (source.includes(`id="${target}"`) || source.includes(`id='${target}'`)) throw new Error(`保留锚点名称冲突：${target}`);
      const line = source.slice(heading.start, heading.end);
      const prefix = line.match(/^ {0,3}#{1,6}(?:[ \t]+|$)/)?.[0] ?? line.match(/^ {0,3}/)[0];
      const closing = /^ {0,3}#{1,6}/.test(line) ? line.match(/[ \t]+#+[ \t]*$/)?.[0] ?? '' : '';
      const end = line.length - closing.length;
      edits.push({ start: heading.start, end: heading.end, text: line.slice(0, prefix.length) +
        `<span id="${target}" data-jobs-toc="v2">` + line.slice(prefix.length, end) + HEADING_END + line.slice(end) });
    }
    return { level: heading.level, title, target };
  }).filter(Boolean);
  return { entries, edits };
}

export function smudgeMarkdown(source) {
  return sourceForm(source);
}

export function cleanMarkdown(source) {
  const local = sourceForm(source);
  const tokens = scan(local).filter(event => event.kind === 'toc');
  if (!tokens.length) return local;
  const eol = local.includes('\r\n') ? '\r\n' : '\n';
  const { entries, edits } = headingEntries(local);
  const stack = [];
  const links = entries.map(entry => {
    while (stack.length && stack.at(-1) >= entry.level) stack.pop();
    const indent = '  '.repeat(stack.length);
    stack.push(entry.level);
    const label = entry.title.replace(/([\\[\]`*_<>])/g, '\\$1');
    return `${indent}- [${label}](#${encodeURIComponent(entry.target)})`;
  });
  for (const token of tokens) {
    const original = local.slice(token.start, token.end);
    const block = [START, `<!-- jobs-toc:source ${JSON.stringify({ v: 2, token: original })} -->`, '<details>', '<summary>📚 目录（点击展开 / 收起）</summary>', '',
      ...(links.length ? links : ['暂无章节。']), '', '</details>', END].join(eol);
    edits.push({ start: token.start, end: token.end, text: block });
  }
  return applyEdits(local, edits);
}

export function inspectMarkdown(source) {
  const events = scan(sourceForm(source));
  return { tocCount: events.filter(event => event.kind === 'toc').length, headingCount: events.filter(event => event.kind === 'heading' && event.level >= 2).length };
}

export function checkMarkdown(source) {
  return scan(source).some(event => event.kind === 'start') && cleanMarkdown(source) === source;
}

function git(args, options = {}) {
  return execFileSync('git', args, { cwd: ROOT, encoding: 'utf8', maxBuffer: 64 * 1024 * 1024, stdio: ['pipe', 'pipe', 'pipe'], ...options });
}

function decode(bytes) {
  return new TextDecoder('utf-8', { fatal: true, ignoreBOM: true }).decode(bytes);
}

function managedFiles() {
  const file = path.join(ROOT, MANIFEST);
  if (!fs.existsSync(file) && SCRIPT === 'Scripts/MarkdownToc.mjs') return ['README.md'];
  const manifest = JSON.parse(decode(fs.readFileSync(file)));
  if (manifest.version !== 1 || !Array.isArray(manifest.files) || !manifest.files.length) throw new Error('目录清单缺失或无效。');
  const files = manifest.files;
  if (new Set(files).size !== files.length || files.some(value => typeof value !== 'string' ||
    path.posix.isAbsolute(value) || value.includes('\\') || value.split('/').some(part => !part || part === '.' || part === '..') || !/\.md$/i.test(value))) {
    throw new Error('目录清单路径重复、越界或不是 .md 文档。');
  }
  return files;
}

function readDocument(relative) {
  const pieces = relative.split('/');
  let current = ROOT;
  for (const piece of pieces) {
    current = path.join(current, piece);
    if (fs.lstatSync(current).isSymbolicLink()) throw new Error(`跳过符号链接：${relative}`);
  }
  const nearest = execFileSync('git', ['-C', path.dirname(current), 'rev-parse', '--show-toplevel'], { encoding: 'utf8' }).trim();
  if (fs.realpathSync(nearest) !== fs.realpathSync(ROOT)) throw new Error(`清单越过独立 Git 边界：${relative}`);
  return decode(fs.readFileSync(current));
}

function replaceDocuments(updates, touchUnchanged = false) {
  const written = [];
  try {
    for (const update of updates) {
      if (update.before === update.after && !touchUnchanged) continue;
      const file = path.join(ROOT, update.file);
      if (decode(fs.readFileSync(file)) !== update.before) throw new Error(`文档被并发修改：${update.file}`);
      const stat = fs.statSync(file);
      if (update.before === update.after) {
        // Installing a driver does not invalidate Git's stat cache by itself.
        // Touch only registered documents so the next ordinary add runs clean.
        fs.utimesSync(file, stat.atime, new Date(Math.max(Date.now(), stat.mtimeMs + 1)));
      } else fs.writeFileSync(file, update.after);
      written.push({ ...update, stat });
    }
  } catch (error) {
    for (const update of written.reverse()) {
      const file = path.join(ROOT, update.file);
      if (decode(fs.readFileSync(file)) === update.after) {
        if (update.before !== update.after) fs.writeFileSync(file, update.before);
        fs.utimesSync(file, update.stat.atime, update.stat.mtime);
      }
    }
    throw error;
  }
}

function requireRepository() {
  if (['GIT_DIR', 'GIT_WORK_TREE', 'GIT_COMMON_DIR'].some(key => process.env[key])) {
    throw new Error('管理命令不接受 GIT_DIR / GIT_WORK_TREE / GIT_COMMON_DIR 定位覆盖；请在目标仓库正常环境运行。');
  }
  if (fs.realpathSync(git(['rev-parse', '--show-toplevel']).trim()) !== fs.realpathSync(ROOT)) {
    throw new Error('安装器必须位于目标仓库的 Scripts 目录，不能改写父仓配置。');
  }
}

function localValues(key) {
  const result = spawnSync('git', ['config', '--local', '--null', '--get-all', key], { cwd: ROOT, encoding: 'utf8' });
  if (result.status === 1) return [];
  if (result.status !== 0) throw new Error(result.stderr || '无法读取 Git 配置。');
  return result.stdout.split('\0').slice(0, -1);
}

function replaceLocal(key, values) {
  const result = spawnSync('git', ['config', '--local', '--unset-all', key], { cwd: ROOT, encoding: 'utf8' });
  if (result.status !== 0 && result.status !== 5) throw new Error(result.stderr || '无法移除 Git 配置。');
  for (const value of values) git(['config', '--local', '--add', key, value]);
}

function shellQuote(value) {
  return "'" + value.replaceAll("'", "'\\''") + "'";
}

function expectedConfiguration() {
  const node = shellQuote(process.execPath.replaceAll('\\', '/'));
  return { [KEYS[0]]: [`${node} ${shellQuote(SCRIPT)} clean`],
    [KEYS[1]]: [`${node} ${shellQuote(SCRIPT)} smudge`], [KEYS[2]]: ['true'] };
}

function statePath() {
  return path.resolve(ROOT, git(['rev-parse', '--git-path', 'jobs-markdown-toc.json']).trim());
}

function install() {
  requireRepository();
  const files = managedFiles();
  const attributes = git(['check-attr', '-z', '--stdin', 'filter'], { input: files.join('\0') + '\0' }).split('\0');
  for (let index = 0; index < files.length; index++) {
    if (attributes[index * 3 + 2] !== DRIVER) throw new Error(`有效 .gitattributes 未注册此过滤器：${files[index]}`);
  }
  const current = Object.fromEntries(KEYS.map(key => [key, localValues(key)]));
  const stateFile = statePath();
  const state = fs.existsSync(stateFile) ? JSON.parse(fs.readFileSync(stateFile, 'utf8')) : null;
  const processFilter = spawnSync('git', ['config', '--get', `filter.${DRIVER}.process`], { cwd: ROOT, encoding: 'utf8' });
  if (processFilter.status !== 1) throw new Error('发现同名 process 过滤器或配置读取失败，停止安装，避免绕过 clean / smudge。');
  const effective = spawnSync('git', ['config', '--get-regexp', `^filter\\.${DRIVER}\\.`], { cwd: ROOT, encoding: 'utf8' });
  if (!state && effective.status !== 1) throw new Error('存在同名过滤器配置或读取失败，保留原配置并停止安装。');
  if (state && (state.version !== 1 || JSON.stringify(current) !== JSON.stringify(state.installed))) {
    throw new Error('过滤器配置已被其他操作改动，保留现场并停止安装。');
  }
  const updates = files.map(file => {
    const before = readDocument(file);
    const after = smudgeMarkdown(before);
    if (!checkMarkdown(cleanMarkdown(after))) throw new Error(`文档没有有效 [toc]，未安装过滤器：${file}`);
    return { file, before, after };
  });
  const installed = expectedConfiguration();
  const next = { version: 1, previous: state?.previous ?? current, installed };
  // Keep the recovery record before touching config; only this driver's keys are changed.
  fs.writeFileSync(stateFile, JSON.stringify(next, null, 2) + '\n', { mode: 0o600 });
  try {
    for (const key of KEYS) replaceLocal(key, installed[key]);
    replaceDocuments(updates, true);
  } catch (error) {
    for (const key of KEYS) replaceLocal(key, current[key]);
    if (state) fs.writeFileSync(stateFile, JSON.stringify(state, null, 2) + '\n');
    else fs.unlinkSync(stateFile);
    throw error;
  }
  console.log(`已启用本仓 ${files.length} 份文档的过滤器：本地 [toc] → 暂存时生成折叠目录。未暂存、提交或推送。`);
}

function uninstall() {
  requireRepository();
  const file = statePath();
  if (!fs.existsSync(file)) throw new Error('没有本工具的安装记录，未修改任何配置。');
  const state = JSON.parse(fs.readFileSync(file, 'utf8'));
  const current = Object.fromEntries(KEYS.map(key => [key, localValues(key)]));
  if (state.version !== 1 || JSON.stringify(current) !== JSON.stringify(state.installed)) {
    throw new Error('过滤器配置已变化，停止卸载，避免覆盖其他操作。');
  }
  const updates = managedFiles().map(file => {
    const before = readDocument(file);
    return { file, before, after: cleanMarkdown(before) };
  });
  try {
    for (const key of KEYS) replaceLocal(key, state.previous[key]);
    replaceDocuments(updates);
  } catch (error) {
    for (const key of KEYS) replaceLocal(key, current[key]);
    throw error;
  }
  fs.unlinkSync(file);
  console.log('已恢复本工具安装前的本仓配置，清单文档保留折叠目录；后续需自行重新生成。未修改暂存区。');
}

function main(args) {
  const [mode, ...extra] = args;
  if (extra.length && (mode !== 'preview' || extra.length !== 1)) throw new Error('不支持额外参数；使用 help 查看入口。');
  if (mode === 'clean' || mode === 'smudge') {
    const bytes = fs.readFileSync(0);
    const source = decode(bytes);
    process.stdout.write(mode === 'clean' ? cleanMarkdown(source) : smudgeMarkdown(source));
  } else if (mode === 'install') {
    install();
  } else if (mode === 'uninstall') {
    uninstall();
  } else if (mode === 'check') {
    requireRepository();
    const errors = [];
    const files = managedFiles();
    for (const file of files) {
      try {
        if (!checkMarkdown(decode(git(['show', `:${file}`], { encoding: 'buffer' })))) errors.push(file);
      } catch (error) { errors.push(`${file}（未暂存、已删除或格式错误）`); }
    }
    if (errors.length) throw new Error(`暂存区目录缺失或过期；请整文件暂存对应文档：\n${errors.join('\n')}`);
    console.log(`暂存区 ${files.length} 份文档的目录与其正文一致。`);
  } else if (mode === 'verify') {
    requireRepository();
    const files = managedFiles();
    for (const file of files) {
      const source = readDocument(file);
      const generated = cleanMarkdown(source);
      if (!inspectMarkdown(source).tocCount || smudgeMarkdown(generated) !== smudgeMarkdown(source) || cleanMarkdown(generated) !== generated) {
        throw new Error(`文档转换往返验证失败：${file}`);
      }
    }
    console.log(`工作区 ${files.length} 份文档转换往返与幂等验证通过；未修改文件或暂存区。`);
  } else if (mode === 'status') {
    requireRepository();
    for (const key of KEYS) console.log(`${key} = ${localValues(key).join(', ') || '(未配置)'}`);
    console.log(`受控文档：${managedFiles().length} 份；清单：${MANIFEST}`);
  } else if (mode === 'preview') {
    const files = managedFiles();
    const file = extra[0] ?? (files.includes('README.md') ? 'README.md' : files[0]);
    if (!files.includes(file)) throw new Error('preview 只能读取已登记的相对文档路径。');
    process.stdout.write(cleanMarkdown(readDocument(file)));
  } else if (!mode || mode === 'help') {
    console.log(`用法：node ${SCRIPT} install | status | uninstall | check | verify | preview [相对文档路径]\nclean / smudge 仅供 Git 从标准输入调用；check 读取原始暂存区，verify 只读核对工作区，preview 不写文件。`);
  } else {
    throw new Error(`未知模式：${mode}`);
  }
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  try { main(process.argv.slice(2)); }
  catch (error) {
    console.error(`MarkdownToc：${error.message}`);
    process.exitCode = 1;
  }
}
