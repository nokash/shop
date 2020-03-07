<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Add Supplier</div>

                    <div class="card-body">
                         <div class="form-group"
                            v-if="status_msg"
                            :class="{ 'alert-success': status, 'alert-danger': !status }"

                            role="alert"
                        >{{ status_msg }}</div>
                        <form action="" @submit="createSupplier(supplier)">
                            <hr>
                            <input type="text" class='form-control' v-model="supplier.name" placeholder="Enter Company Name">
                            <br>

                            <button
                             @click.prevent="createSupplier(supplier)" class="btn btn-success">
                             {{ isCreatingPost ? "Posting..." : "Create Post" }}</button>

                        </form>

                    </div>
                    <div class="card-footer"></div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { setTimeout } from "timers";

export default {


        data(){
            return {
                supplier: {
                    name: ''
                },
                status: "",
                status_msg: "",
                isCreatingPost: false,

            };
        },

        methods: {
            createSupplier(supplier){

                if(!this.validateForm()){
                    return false;
                } else{
                        this.$store.dispatch('createSupplier', supplier);

                        const that = this;
                        this.isCreatingPost = true;
                        this.supplier.name = "";
                        this.status = true;

                        this.shownotification("Supplier Added Successfully");
                        this.isCreatingPost = !this.isCreatingPost;
                }


            },
            content(){
                console.log(supplier.name);
            },

            validateForm(){
                if(!this.supplier.name){
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

        }


};
</script>
