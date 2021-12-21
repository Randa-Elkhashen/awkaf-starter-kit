import {ref , onMounted , computed} from "vue"
export default function useComposite2(){
  const computedVal =   computed( ()=> {
        console.log("computed")
        // eslint-disable-next-line no-undef
        return this.count.value + 10
    })
    onMounted(()=>{
        console.log("mounted 2")
    })
    const searchQuery = ref('')
    const repositoriesMatchingSearchQuery = computed(() => {
        // eslint-disable-next-line no-undef
        console.log("repos" , repositories)
      // eslint-disable-next-line no-undef
      return repositories.value.filter(repository => {
        return repository.name.includes(searchQuery.value)
      })
    })

    return { computedVal ,
        searchQuery,
        repositoriesMatchingSearchQuery
  
    }
        
}