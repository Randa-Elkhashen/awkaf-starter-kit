const authStore = {
    // Initial state 
    namespaced: true,
    state() {
        return {
            isAuthenticated: false,
        }
    },
    getters: {
        checkAuth(state) {
            return state.isAuthenticated
        }
    },
    mutations: {
        setAuth(state){
            state.isAuthenticated = !state.isAuthenticated
        }
    },
    actions: {}
}

export default authStore