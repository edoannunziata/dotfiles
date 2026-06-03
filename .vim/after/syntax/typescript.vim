" Work around pathological backtracking in Vim's bundled TypeScript syntax
" for incomplete arrow-function call arguments such as `.map(c =>`.
syntax clear typescriptArrowFuncDef

syntax match typescriptArrowFuncDef contained /\K\k*\s*=>/
  \ contains=typescriptArrowFuncArg,typescriptArrowFunc
  \ nextgroup=@typescriptExpression,typescriptBlock
  \ skipwhite skipempty

syntax match typescriptArrowFuncDef contained /([^()]*)\s*=>/
  \ contains=typescriptArrowFuncArg,typescriptArrowFunc,@typescriptCallSignature
  \ nextgroup=@typescriptExpression,typescriptBlock
  \ skipwhite skipempty

syntax region typescriptArrowFuncDef contained start=/([^()]*):/ matchgroup=typescriptArrowFunc end=/=>/
  \ contains=typescriptArrowFuncArg,typescriptTypeAnnotation,@typescriptCallSignature
  \ nextgroup=@typescriptExpression,typescriptBlock
  \ skipwhite skipempty keepend oneline
