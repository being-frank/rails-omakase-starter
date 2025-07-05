Array.from(import.meta.glob('./**/index.js', { eager: true })).forEach(async (path) => {
  const cssModule = await import(/* @vite-ignore */ path)
  cssModule.default()
})
