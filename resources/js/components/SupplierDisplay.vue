<template>
    <div class="row">
        <div class="col-md-6" v-for="(post, i) in suppliers" :key=i>
            <div class="card mt-4">
                <div class="card-body">
                    <p class="card-text"><strong>Company Name: </strong> {{ post.name }}<br>

                    </p>
                </div>
                <button class="btn btn-primary m-2" @click="viewCompany(i)">View Company</button>
                <button class="btn btn-danger m-2" @click="deleteBook(i)">Delete</button>
                <button class="btn btn-success m-2" type="danger" >Edit Company</button>

            </div>
        </div>
        <el-dialog v-if="currentPost" :visible.sync="postDialogVisible" width="40%">
            <span>
                <h3>Created: {{ currentPost.created_at }}</h3>
                <hr>
                <p> Company Name: {{ currentPost.name }}</p>
            </span>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="postDialogVisible = false">Okay</el-button>
                  </span>
        </el-dialog>
    </div>
</template>
<script>
import { mapState } from 'vuex';

export default {
    data() {
        return {
            postDialogVisible: false,
            currentPost: '',
        };
    },

    computed: {
        ...mapState(['suppliers'])
    },

    beforeMount() {
        this.$store.dispatch('getSuppliers');
    },

    mounted(){
        console.log(suppliers)
    },

    methods: {
        truncateText(text){
            if(text.length > 24 ){
                return `${text.substr(0, 24)}...`
            }

            return text;
        },

        viewCompany(postIndex){
            const post = this.suppliers[postIndex];
            this.currentPost = post;
            this.postDialogVisible = true;
        },
        deletePost(post) {
                    this.$store.dispatch('deletePost',post)
        },

        deleteBook(postIndex) {
            const post = this.suppliers[postIndex];
                this.axios
                    .delete(`/api/supplier/delete/${post.id}`)
                    .then(response => {
                        let i = this.suppliers.map(item => item.id).indexOf(id); // find index of your object
                        this.suppliers.splice(i, 1)
                    });
        }

    },

}
</script>
