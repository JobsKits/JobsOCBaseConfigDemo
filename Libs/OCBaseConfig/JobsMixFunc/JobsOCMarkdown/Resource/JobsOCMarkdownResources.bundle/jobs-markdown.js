(() => {
  "use strict";

  const contentElement = document.getElementById("jobs-markdown-content");
  const baseElement = document.getElementById("jobs-markdown-base");
  const customStyleElement = document.getElementById("jobs-markdown-custom-style");
  let lastPayload = null;
  const languageAliases = {
    "c++": "cpp",
    "c#": "csharp",
    "html": "xml",
    "objc": "objectivec",
    "objective-c": "objectivec",
    "oc": "objectivec",
    "sh": "bash",
    "shell": "bash",
    "text": "plaintext",
    "txt": "plaintext",
    "yml": "yaml"
  };

  function post(type, payload = {}) {
    const message = { type, ...payload };
    const handler = window.webkit?.messageHandlers?.jobsMarkdown;
    if (handler) {
      handler.postMessage(message);
    } else {
      window.dispatchEvent(new CustomEvent("jobsMarkdownMessage", { detail: message }));
    }
  }

  function escapeHTML(value) {
    return String(value)
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll("\"", "&quot;")
      .replaceAll("'", "&#039;");
  }

  function stripFrontMatter(markdown) {
    const normalized = String(markdown || "").replace(/^\uFEFF/, "");
    if (!normalized.startsWith("---\n") && !normalized.startsWith("---\r\n")) {
      return normalized;
    }
    const match = normalized.match(/^---\s*\r?\n[\s\S]*?\r?\n---\s*(?:\r?\n|$)/);
    return match ? normalized.slice(match[0].length) : normalized;
  }

  function installMathRules(markdownIt) {
    markdownIt.inline.ruler.after("escape", "jobs_math_inline", (state, silent) => {
      if (state.src[state.pos] !== "$" || state.src[state.pos + 1] === "$") return false;
      let cursor = state.pos + 1;
      while ((cursor = state.src.indexOf("$", cursor)) !== -1) {
        if (state.src[cursor - 1] === "\\") {
          cursor += 1;
          continue;
        }
        const expression = state.src.slice(state.pos + 1, cursor);
        if (!expression.trim() || /^\s|\s$/.test(expression)) return false;
        if (!silent) {
          const token = state.push("jobs_math_inline", "span", 0);
          token.content = expression;
        }
        state.pos = cursor + 1;
        return true;
      }
      return false;
    });
    markdownIt.inline.ruler2.after("emphasis", "jobs_math_inline_balance", () => true);
    markdownIt.renderer.rules.jobs_math_inline = (tokens, index) => {
      const expression = encodeURIComponent(tokens[index].content);
      return `<span class="jobs-math-inline" data-jobs-math="${escapeHTML(expression)}"></span>`;
    };

    markdownIt.block.ruler.after("blockquote", "jobs_math_block", (state, startLine, endLine, silent) => {
      const start = state.bMarks[startLine] + state.tShift[startLine];
      const maximum = state.eMarks[startLine];
      const firstLine = state.src.slice(start, maximum);
      if (!firstLine.startsWith("$$")) return false;
      if (silent) return true;

      const lines = [];
      const inlineRemainder = firstLine.slice(2);
      if (inlineRemainder.endsWith("$$") && inlineRemainder.length > 2) {
        lines.push(inlineRemainder.slice(0, -2));
        state.line = startLine + 1;
      } else {
        if (inlineRemainder.trim()) lines.push(inlineRemainder);
        let nextLine = startLine + 1;
        for (; nextLine < endLine; nextLine += 1) {
          const lineStart = state.bMarks[nextLine] + state.tShift[nextLine];
          const lineEnd = state.eMarks[nextLine];
          const line = state.src.slice(lineStart, lineEnd);
          if (line.trimEnd().endsWith("$$")) {
            lines.push(line.replace(/\$\$\s*$/, ""));
            nextLine += 1;
            break;
          }
          lines.push(line);
        }
        state.line = nextLine;
      }
      const token = state.push("jobs_math_block", "div", 0);
      token.block = true;
      token.content = lines.join("\n").trim();
      token.map = [startLine, state.line];
      return true;
    });
    markdownIt.renderer.rules.jobs_math_block = (tokens, index) => {
      const expression = encodeURIComponent(tokens[index].content);
      return `<div class="jobs-math-block" data-jobs-math="${escapeHTML(expression)}"></div>`;
    };
  }

  function createMarkdownIt(payload) {
    const markdownIt = window.markdownit({
      html: true,
      breaks: false,
      linkify: true,
      typographer: false,
      highlight(code, language) {
        const requested = String(language || "").trim().toLowerCase();
        const resolved = languageAliases[requested] || requested;
        if (resolved && window.hljs?.getLanguage(resolved)) {
          try {
            return window.hljs.highlight(code, {
              language: resolved,
              ignoreIllegals: true
            }).value;
          } catch (_) {
            return escapeHTML(code);
          }
        }
        return escapeHTML(code);
      }
    });

    const defaultFence = markdownIt.renderer.rules.fence.bind(markdownIt.renderer.rules);
    markdownIt.renderer.rules.fence = (tokens, index, options, environment, renderer) => {
      const token = tokens[index];
      const language = token.info.trim().split(/\s+/)[0].toLowerCase();
      if (payload.rendersMermaid && language === "mermaid") {
        return `<div class="mermaid">${escapeHTML(token.content)}</div>`;
      }
      return defaultFence(tokens, index, options, environment, renderer);
    };
    if (payload.rendersMath) installMathRules(markdownIt);
    return markdownIt;
  }

  function sanitizedHTML(html, enabled) {
    if (!enabled || !window.DOMPurify) return html;
    return window.DOMPurify.sanitize(html, {
      ADD_TAGS: ["iframe", "details", "summary"],
      ADD_ATTR: [
        "allow",
        "allowfullscreen",
        "data-jobs-math",
        "data-jobs-toc",
        "frameborder",
        "loading",
        "referrerpolicy",
        "target"
      ],
      ALLOWED_URI_REGEXP: /^(?:(?:https?|mailto|tel|file):|[^a-z]|[a-z+.-]+(?:[^a-z+.-:]|$))/i
    });
  }

  function slugify(value) {
    const normalized = String(value || "")
      .trim()
      .toLowerCase()
      .replace(/\s+/g, "-");
    try {
      return normalized
        .replace(/[^\p{Letter}\p{Number}\-_]/gu, "")
        .replace(/-+/g, "-")
        .replace(/^-|-$/g, "") || "section";
    } catch (_) {
      return normalized.replace(/[^\w\u3400-\u9fff-]/g, "") || "section";
    }
  }

  function installHeadingAnchors() {
    const used = new Map();
    contentElement.querySelectorAll("h1,h2,h3,h4,h5,h6").forEach((heading) => {
      const base = heading.id || slugify(heading.textContent);
      const count = used.get(base) || 0;
      used.set(base, count + 1);
      heading.id = count === 0 ? base : `${base}-${count}`;
    });
  }

  function installTableOfContents(enabled) {
    const placeholders = contentElement.querySelectorAll("[data-jobs-toc]");
    placeholders.forEach((placeholder) => {
      if (!enabled) {
        placeholder.remove();
        return;
      }
      const headings = [...contentElement.querySelectorAll("h1,h2,h3,h4,h5,h6")]
        .filter((heading) => !placeholder.contains(heading));
      if (!headings.length) {
        placeholder.remove();
        return;
      }
      const list = document.createElement("ol");
      headings.forEach((heading) => {
        const item = document.createElement("li");
        item.className = `jobs-toc-level-${heading.tagName.slice(1)}`;
        const link = document.createElement("a");
        link.href = `#${heading.id}`;
        link.textContent = heading.textContent;
        item.appendChild(link);
        list.appendChild(item);
      });
      placeholder.classList.add("jobs-toc");
      placeholder.replaceChildren(list);
    });
  }

  function installTaskLists() {
    contentElement.querySelectorAll("li").forEach((item) => {
      const firstNode = item.firstChild;
      if (!firstNode || firstNode.nodeType !== Node.TEXT_NODE) return;
      const match = firstNode.textContent.match(/^\s*\[([ xX])\]\s+/);
      if (!match) return;
      firstNode.textContent = firstNode.textContent.slice(match[0].length);
      const checkbox = document.createElement("input");
      checkbox.type = "checkbox";
      checkbox.disabled = true;
      checkbox.checked = match[1].toLowerCase() === "x";
      item.prepend(checkbox);
      item.classList.add("task-list-item");
      item.parentElement?.classList.add("task-list");
    });
  }

  function installCallouts() {
    const labels = {
      NOTE: "说明",
      TIP: "提示",
      IMPORTANT: "重要",
      WARNING: "警告",
      CAUTION: "注意"
    };
    contentElement.querySelectorAll("blockquote").forEach((blockquote) => {
      const firstParagraph = blockquote.querySelector(":scope > p:first-child");
      if (!firstParagraph) return;
      const match = firstParagraph.textContent.match(/^\s*\[!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\]\s*/i);
      if (!match) return;
      const type = match[1].toUpperCase();
      const textNode = [...firstParagraph.childNodes]
        .find((node) => node.nodeType === Node.TEXT_NODE && node.textContent.includes(match[0]));
      if (textNode) textNode.textContent = textNode.textContent.replace(match[0], "");
      const title = document.createElement("span");
      title.className = "jobs-callout-title";
      title.textContent = labels[type];
      blockquote.prepend(title);
      blockquote.classList.add("jobs-callout", `jobs-callout-${type.toLowerCase()}`);
      if (!firstParagraph.textContent.trim() && !firstParagraph.children.length) firstParagraph.remove();
    });
  }

  function installCodeBlocks(showsCopyButton) {
    contentElement.querySelectorAll("pre > code").forEach((code) => {
      const pre = code.parentElement;
      if (!pre || pre.parentElement?.classList.contains("jobs-code-block")) return;
      const wrapper = document.createElement("div");
      wrapper.className = "jobs-code-block";
      pre.replaceWith(wrapper);
      wrapper.appendChild(pre);
      const languageClass = [...code.classList].find((value) => value.startsWith("language-"));
      if (languageClass) {
        wrapper.classList.add("jobs-code-has-language");
        const language = document.createElement("span");
        language.className = "jobs-code-language";
        language.textContent = languageClass.slice("language-".length);
        wrapper.appendChild(language);
      }
      if (showsCopyButton) {
        const button = document.createElement("button");
        button.type = "button";
        button.className = "jobs-code-copy";
        button.textContent = "复制";
        button.addEventListener("click", () => {
          post("copy", { text: code.textContent || "" });
          button.textContent = "已复制";
          window.setTimeout(() => { button.textContent = "复制"; }, 1200);
        });
        wrapper.appendChild(button);
      }
    });
  }

  function installResourceDiagnostics(allowsRemoteContent) {
    contentElement.querySelectorAll("img,video,audio,source,iframe").forEach((element) => {
      const source = element.getAttribute("src") || "";
      if (!allowsRemoteContent && /^https?:/i.test(source)) {
        element.removeAttribute("src");
        element.classList.add("jobs-remote-blocked");
        element.setAttribute("aria-label", "远程资源已禁用");
      }
      element.addEventListener("error", () => {
        element.classList.add("jobs-resource-error");
        if (element instanceof HTMLImageElement && element.alt) {
          element.setAttribute("aria-label", `资源加载失败：${element.alt}`);
        }
      }, { once: true });
    });
  }

  function renderMath(enabled) {
    if (!enabled || !window.katex) return;
    contentElement.querySelectorAll("[data-jobs-math]").forEach((element) => {
      const expression = decodeURIComponent(element.dataset.jobsMath || "");
      try {
        window.katex.render(expression, element, {
          displayMode: element.classList.contains("jobs-math-block"),
          throwOnError: false,
          strict: "ignore",
          trust: false
        });
      } catch (error) {
        element.textContent = expression;
        element.classList.add("jobs-resource-error");
      }
    });
  }

  async function renderMermaid(enabled, appearance) {
    if (!enabled || !window.mermaid) return;
    const nodes = [...contentElement.querySelectorAll(".mermaid")];
    if (!nodes.length) return;
    const dark = appearance === "dark"
      || (appearance === "automatic" && window.matchMedia("(prefers-color-scheme: dark)").matches);
    window.mermaid.initialize({
      startOnLoad: false,
      securityLevel: "strict",
      theme: dark ? "dark" : "default",
      flowchart: { htmlLabels: true, useMaxWidth: true }
    });
    await window.mermaid.run({ nodes, suppressErrors: false });
  }

  function installLinkHandling() {
    contentElement.onclick = (event) => {
      const anchor = event.target.closest?.("a[href]");
      if (!anchor) return;
      const raw = anchor.getAttribute("href") || "";
      if (raw.startsWith("#")) return;
      event.preventDefault();
      post("link", { url: anchor.href });
    };
  }

  function applyAppearance(appearance) {
    const resolved = ["automatic", "light", "dark"].includes(appearance)
      ? appearance
      : "automatic";
    document.documentElement.dataset.theme = resolved;
  }

  async function render(payload) {
    try {
      lastPayload = { ...payload };
      const source = stripFrontMatter(payload.markdown)
        .replace(/^[\t ]*\[toc\][\t ]*$/gim, "<nav data-jobs-toc></nav>");
      const baseURL = String(payload.baseURL || "");
      baseElement.href = baseURL && !baseURL.endsWith("/") ? `${baseURL}/` : baseURL;
      document.title = payload.title || "Markdown";
      document.documentElement.style.setProperty(
        "--jobs-font-scale",
        String(Math.min(Math.max(Number(payload.fontScale) || 1, 0.75), 2))
      );
      customStyleElement.textContent = payload.customCSS || "";
      applyAppearance(payload.appearance);

      const markdownIt = createMarkdownIt(payload);
      contentElement.innerHTML = sanitizedHTML(
        markdownIt.render(source),
        payload.sanitizesHTML
      );
      installHeadingAnchors();
      installTableOfContents(payload.showsTableOfContents);
      installTaskLists();
      installCallouts();
      installCodeBlocks(payload.showsCodeCopyButton);
      installResourceDiagnostics(payload.allowsRemoteContent);
      renderMath(payload.rendersMath);
      installLinkHandling();
      await renderMermaid(payload.rendersMermaid, payload.appearance);
      post("rendered", { title: document.title });
    } catch (error) {
      post("error", {
        message: error?.stack || error?.message || String(error)
      });
    }
  }

  function renderJSON(json) {
    render(JSON.parse(json));
  }

  function decodeBase64UTF8(base64) {
    const binary = atob(base64);
    const bytes = new Uint8Array(binary.length);
    for (let index = 0; index < binary.length; index += 1) {
      bytes[index] = binary.charCodeAt(index);
    }
    return new TextDecoder("utf-8").decode(bytes);
  }

  function renderBase64(base64) {
    renderJSON(decodeBase64UTF8(base64));
  }

  function refreshAppearance(appearance) {
    if (!lastPayload) {
      applyAppearance(appearance);
      return;
    }
    render({ ...lastPayload, appearance });
  }

  function scrollToAnchor(anchor, animated = true) {
    const value = String(anchor || "").replace(/^#/, "");
    const target = document.getElementById(value)
      || document.getElementById(decodeURIComponent(value));
    target?.scrollIntoView({ behavior: animated ? "smooth" : "auto", block: "start" });
  }

  window.JobsMarkdownRuntime = {
    applyAppearance,
    refreshAppearance,
    render,
    renderBase64,
    renderJSON,
    scrollToAnchor
  };
  post("ready");
})();
