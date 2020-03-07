<template>
    <div class="row">
        <div class="col-md-6" v-for="(supplier, i) in suppliers" :key=i>
            <div class="card mt-4">
                <div class="card-body">
                    <p class="card-text"><strong>Company Name: </strong> {{ supplier.name }}<br>

                    </p>
                </div>
                <button class="btn btn-primary m-2" @click="editCompany(i)">Edit Company</button>
                <button class="btn btn-danger m-2" @click="deleteSupplier(supplier)">Del</button>


            </div>
        </div>
        <el-dialog v-if="currentPost" :visible.sync="postDialogVisible" width="40%">
            <p class="card-text"><strong> Edit Company Name </strong></p>
            <div class="form-group"
                v-if="status_msg"
                :class="{ 'alert-success': status, 'alert-danger': !status }"
                role="alert"
                >{{ status_msg }}
            </div>
            <span>

                <form action="" @submit="updateSupplier(currentPost)">
                            <hr>
                            <input type="text" class='form-control' v-model="currentPost.name" placeholder="Enter Company Name">
                            <br>

                            <button
                             @click.prevent="updateSupplier(currentPost)" class="btn btn-success">Update Post</button>
                </form>

            </span>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="postDialogVisible = false">Okay</el-button>


                </span>
        </el-dialog>


    </div>
</template>
<script>

import { mapGetters } from "vuex";


export default {
    mounted() {
        this.$store.dispatch('fetchSuppliers')
    },

    data(){
        return {
            postDialogVisible: false,
            currentPost: '',
            status: "",
            status_msg: "",
        }
    },

    computed:{
        ...mapGetters([
            'suppliers'
        ])
    },

    methods:{
        deleteSupplier(supplier){
            this.$store.dispatch('deleteSupplier', supplier)
        },

        updateSupplier(currentPost){

                if(!this.validateForm()){
                    return false;
                } else{
                        this.$store.dispatch('updateSupplier', currentPost);

                        const that = this;

                        this.currentPost.name = "";
                        this.status = true;
                        this.$store.dispatch('fetchSuppliers')
                        this.shownotification("Supplier Updated Successfully");
                        this.postDialogVisible = false;

                }

        },

        editCompany(postIndex){
            const supplier = this.suppliers[postIndex];
            this.currentPost = supplier;
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


}
</script>
