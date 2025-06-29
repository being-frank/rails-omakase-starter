Array.from(import.meta.glob('./**/index.js')).forEach(async (path) => {
  const cssModule = await import(/* @vite-ignore */ path)
  cssModule.default()
})
