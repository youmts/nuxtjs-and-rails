import Index from '../pages/index.vue'

describe('pages/index.vue', () => {
  it('has a default value', () => {
    console.log(Index)
    const defaultData = Index.options.data()
    expect(defaultData.subTitle).toBe("Zenn is good service!!")
  })
})
