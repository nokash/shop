<template>
    <div style="height: 32rem; overflow-y: scroll">
        <h4 class="text-center font-weight-bold">Products</h4>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Title</th>
                <th scope="col">Supplier</th>
                <th scope="col">Description</th>
                <th scope="col">Quantity</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody >
            <tr v-for="(post, i) in products" :key=i>
                <td>{{post.name}}</td>
                <td>{{post.supplier}}</td>
                <td>{{post.description}}</td>
                <td>{{post.quantity}}</td>
                <td>
                    <button class="btn btn-danger" @click="deleteProduct(post)">Del</button>

                    <button class="btn btn-primary" @click="editCompany(i)">Edit</button>

                </td>
            </tr>
            </tbody>
        </table>
        <el-dialog v-if="currentPost" :visible.sync="postDialogVisible" width="40%">

            <p class="card-text"><strong> Edit This Product </strong></p>
            <div class="form-group"
                v-if="status_msg"
                :class="{ 'alert-success': status, 'alert-danger': !status }"
                role="alert"
                >{{ status_msg }}
            </div>
            <span>

                <form action="" @submit="updateProduct(currentPost)">
                            <label>Product Name</label>
                            <input class='form-control' v-model="currentPost.name" placeholder="Enter Product Name">
                            <br>
                            <label>Product Description</label>
                             <input class='form-control' v-model="currentPost.description" placeholder="Enter Product Description">
                             <br>
                             <label>Product Quantity</label>
                             <input class='form-control' v-model.number="currentPost.quantity" type="number" maxlength="3" min="1" max="100" placeholder="Enter The Quantity">
                             <br>

                            <button
                             @click.prevent="updateProduct(currentPost)" class="btn btn-success">Update Post</button>
                </form>

            </span>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="postDialogVisible = false">Okay</el-button>


                </span>
        </el-dialog>
    </div>

</template>

<script>
    import {mapGetters} from 'vuex'

    export default {

        data(){
            return{
                postDialogVisible: false,
                currentPost: '',
                status: "",
                status_msg: "",
            }
        },

        mounted() {
            this.$store.dispatch('fetchProducts')
        },
        methods:{
        deleteProduct(product){
            this.$store.dispatch('deleteProduct', product)
        },

        updateProduct(currentPost){

                if(!this.validateForm()){
                    return false;
                } else{
                        this.$store.dispatch('updateProduct', currentPost);

                        const that = this;

                        this.currentPost.name = this.currentPost.quantity = this.currentPost.description = "";
                        this.status = true;
                        this.$store.dispatch('fetchProducts')
                        this.shownotification("Product Updated Successfully");
                        this.postDialogVisible = false;

                }

        },

        editCompany(postIndex){
            const product = this.products[postIndex];
            this.currentPost = product;
            this.postDialogVisible = true;
        },

        truncateText(text){
            if(text.length > 24 ){
                return `${text.substr(0, 24)}...`
            }

            return text;
        },

        validateForm(){
                if(!this.currentPost.name){
                    this.status = false;
                    this.shownotification("Company Name cannot be empty!");
                    return false;
                }
                return true;
        },

        shownotification(message){
                this.status_msg = message;
                setTimeout(() => {
                    this.status_msg = "";
                }, 3000)
        }


    },
        computed: {
            ...mapGetters([
                'products'
            ])
        }
    }
</script>

<style scoped>

</style>
