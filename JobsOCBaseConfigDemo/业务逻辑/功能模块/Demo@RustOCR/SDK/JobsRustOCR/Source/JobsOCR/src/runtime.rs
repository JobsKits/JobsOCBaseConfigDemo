use ort::session::Session;
use ort::value::Tensor;
use std::collections::HashMap;
use std::path::Path;
use std::sync::OnceLock;

pub type Result<T> = std::result::Result<T, String>;
static ENVIRONMENT: OnceLock<Result<ort::environment::Environment>> = OnceLock::new();

pub struct FloatOutput {
    pub shape: Vec<usize>,
    pub values: Vec<f32>,
}

pub struct Model {
    session: Session,
}

impl Model {
    pub fn load(path: &Path) -> Result<Self> {
        let environment = ENVIRONMENT
            .get_or_init(|| {
                ort::init()
                    .with_name("Jobs Rust OCR")
                    .build()
                    .map_err(|e| e.to_string())
            })
            .as_ref()
            .map_err(Clone::clone)?;
        let session = Session::builder(environment)
            .map_err(|e| e.to_string())?
            .with_intra_threads(2)
            .map_err(|e| e.to_string())?
            .with_inter_threads(1)
            .map_err(|e| e.to_string())?
            .with_memory_pattern(false)
            .map_err(|e| e.to_string())?
            .with_execution_providers([ort::ep::CPU::default().with_arena_allocator(false).build()])
            .map_err(|e| e.to_string())?
            .commit_from_file(path)
            .map_err(|e| format!("{}: {e}", path.display()))?;
        Ok(Self { session })
    }

    pub fn float(&mut self, shape: Vec<usize>, values: Vec<f32>) -> Result<Vec<FloatOutput>> {
        let tensor = Tensor::from_array((shape, values)).map_err(|e| e.to_string())?;
        let outputs = self
            .session
            .run(ort::inputs!["x" => tensor])
            .map_err(|e| e.to_string())?;
        outputs
            .iter()
            .map(|(_, value)| {
                let (shape, values) = value
                    .try_extract_tensor::<f32>()
                    .map_err(|e| e.to_string())?;
                Ok(FloatOutput {
                    shape: shape.iter().map(|n| *n as usize).collect(),
                    values: values.to_vec(),
                })
            })
            .collect()
    }

    pub fn recognize(
        &mut self,
        shape: Vec<usize>,
        values: Vec<f32>,
        width: i64,
    ) -> Result<Recognition> {
        let tensor = Tensor::from_array((shape, values)).map_err(|e| e.to_string())?;
        let widths = Tensor::from_array(([1], vec![width])).map_err(|e| e.to_string())?;
        let outputs = self
            .session
            .run(ort::inputs!["x" => tensor, "widths" => widths])
            .map_err(|e| e.to_string())?;
        let (_, ids) = outputs["ids"]
            .try_extract_tensor::<i64>()
            .map_err(|e| e.to_string())?;
        let (_, conf) = outputs["conf"]
            .try_extract_tensor::<f32>()
            .map_err(|e| e.to_string())?;
        let (_, lengths) = outputs["lengths"]
            .try_extract_tensor::<i64>()
            .map_err(|e| e.to_string())?;
        let length = (*lengths.first().unwrap_or(&0)).max(0) as usize;
        let mut extra = HashMap::new();
        for key in ["blank", "topv"] {
            if let Some(value) = outputs.get(key) {
                let (s, v) = value
                    .try_extract_tensor::<f32>()
                    .map_err(|e| e.to_string())?;
                extra.insert(
                    key.to_string(),
                    FloatOutput {
                        shape: s.iter().map(|n| *n as usize).collect(),
                        values: v.to_vec(),
                    },
                );
            }
        }
        let top_indices = outputs
            .get("topi")
            .and_then(|v| v.try_extract_tensor::<i64>().ok())
            .map(|(_, a)| a.to_vec());
        Ok(Recognition {
            ids: ids[..length.min(ids.len())].to_vec(),
            confidence: conf[..length.min(conf.len())].to_vec(),
            extra,
            top_indices,
        })
    }

    pub fn classify(
        &mut self,
        shape: Vec<usize>,
        values: Vec<f32>,
        width: i64,
    ) -> Result<Vec<f32>> {
        let x = Tensor::from_array((shape, values)).map_err(|e| e.to_string())?;
        let widths = Tensor::from_array(([1], vec![width])).map_err(|e| e.to_string())?;
        let out = self
            .session
            .run(ort::inputs!["x" => x, "widths" => widths])
            .map_err(|e| e.to_string())?;
        let (_, v) = out[0]
            .try_extract_tensor::<f32>()
            .map_err(|e| e.to_string())?;
        Ok(v.to_vec())
    }

    pub fn order(&mut self, feats: Vec<f32>, rows: usize) -> Result<Vec<FloatOutput>> {
        let feature_count = feats.len() / rows.max(1);
        let x = Tensor::from_array(([1, rows, feature_count], feats)).map_err(|e| e.to_string())?;
        let mask = Tensor::from_array(([1, rows], vec![true; rows])).map_err(|e| e.to_string())?;
        let outputs = self
            .session
            .run(ort::inputs!["feats" => x, "mask" => mask])
            .map_err(|e| e.to_string())?;
        outputs
            .iter()
            .map(|(_, value)| {
                let (s, v) = value
                    .try_extract_tensor::<f32>()
                    .map_err(|e| e.to_string())?;
                Ok(FloatOutput {
                    shape: s.iter().map(|n| *n as usize).collect(),
                    values: v.to_vec(),
                })
            })
            .collect()
    }
}

pub struct Recognition {
    pub ids: Vec<i64>,
    pub confidence: Vec<f32>,
    pub extra: HashMap<String, FloatOutput>,
    pub top_indices: Option<Vec<i64>>,
}
