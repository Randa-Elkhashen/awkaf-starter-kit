
<template>
<div>
    {{repositoriesMatchingSearchQuery}}
</div>
</template>

<script>
import useComposite from "./composite"
import useComposite2 from "./composite2"
    export default {
        name: 'Composition',
        setup(props) {
           const {count , repositories} =  useComposite()
           const { computedVal , repositoriesMatchingSearchQuery} = useComposite2()

            return { count , repositories , computedVal ,  repositoriesMatchingSearchQuery}
        },
        mounted(){
            console.log("mounted 0") 
        }
    }
</script>
