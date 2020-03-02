<template>
    <div class="row">
        <div class="col-md-6" v-for="(post, i) in suppliers" :key=i>
            <div class="card mt-4">
                <div class="card-body">
                    <p class="card-text"><strong>Company Name: </strong> {{ post.name }}<br>

                    </p>
                </div>
                <button class="btn btn-success m-2" @click="viewPost(i)">View Company</button>
            </div>
        </div>
        <el-dialog v-if="currentPost" :visible.sync="postDialogVisible" width="40%">
            <span>
                <h3>Created: {{ currentPost.created_at }}</h3>
                <hr>
                <p> Order No: {{ currentPost.order_number }}</p>
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

    methods: {
        truncateText(text){
            if(text.length > 24 ){
                return `${text.substr(0, 24)}...`
            }

            return text;
        },

        viewPost(postIndex){
            const post = this.posts[postIndex];
            this.currentPost = post;
            this.postDialogVisible = true;
        }
    },

}
</script>
