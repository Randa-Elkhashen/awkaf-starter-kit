# Feature Guide

## how to get feature work
- You can add the dirctive as global or local.

As local
```
import LazyLoadDirective from "@/directive/LazyLoadDirective"
export default {
  directives: {
    lazyload: LazyLoadDirective
  },
};
``` 

As global 
 
```
import App from './App.vue'
import LazyLoadDirective from "@/directive/LazyLoadDirective"
app.directive('lazyload', LazyLoadDirective)

```

- Then you have to put "v-directiveName" "v-lazyload" in the image parent.

Example
```
<a href="#" v-lazyload>
    <img src="image src" alt="card image" />
</a>
```

- After that you have to put to data-attribute (data-url: for api image) (data-default: for the defaut image).

Example
```
<a href="#" v-lazyload>
    <img :data-url="api image url" data-default="defaut image" src="image src" alt="card image" />
</a>
```

- Now we will do the card to be lazy loading with animation by using bootstrap classes "placeholder-glow & placeholder", note that the "placeholder-glow" class to be parent and the "placeholder" to be child then control your colors&With and height.

Example
```
<a href="#" class="placeholder-glow">
    <h3 class="placeholder"></h3>
</a>
```
