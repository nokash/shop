<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Add Product</div>
                    <div class="form-group"
                            v-if="status_msg"
                            :class="{ 'alert-success': status, 'alert-danger': !status }"

                            role="alert"
                        >{{ status_msg }}</div>
                    <div class="card-body">

                       <form action="" @submit="createProduct(product)">
                            <br>
                            <p >Enter ID as: {{ lasts.id + 1 }}</p>
                             <input class='form-control'  v-model.number="product.id"  type="number" maxlength="3" min="1" max="100" placeholder="Enter ID">

                            <label>Select Supplier:</label>
                            <select class='form-control' v-model='product.supplier_id' @change='getCompany()'>
                              <option value='0' >Select Supplier</option>
                              <option v-for="(company, i) in companies" :value=company.id :key=i>{{ company.name }}</option>
                            </select>

                            <hr>
                            <input class='form-control' v-model="product.name" placeholder="Enter Product Name">
                            <br>
                             <input class='form-control' v-model="product.description" placeholder="Enter Product Description">
                             <br>
                             <input class='form-control' v-model.number="product.quantity" type="number" maxlength="3" min="1" max="100" placeholder="Enter The Quantity">
                             <br>
                              <button
                             @click.prevent="createProduct(product)" class="btn btn-success">
                             {{ isCreatingPost ? "Posting..." : "Create Post" }}</button>
                       </form>


                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
 import {mapGetters} from 'vuex'

    export default {
        mounted() {
            this.$store.dispatch('fetchLastId')
            console.log('Component mounted.')
        },
        data(){
            return {

                companies: [],
                product: {
                    id: 0,
                    name: '',
                    description: '',
                    supplier_id: 0,
                    quantity: '',

                },
                status: "",
                status_msg: "",
                isCreatingPost: false,


            }
        },
        methods:{
            getCompany: function(){
              axios.get('/api/supplier/all')
              .then(function (response) {
                 this.companies = response.data;
              }.bind(this));

            },
            createProduct(product){

                if(!this.validateForm()){
                    return false;
                } else{
                        this.$store.dispatch('createProduct', product);

                        const that = this;
                        this.isCreatingPost = true;
                        this.product.name = this.product.description = "";
                        this.product.quantity = 0;
                        this.status = true;

                        this.shownotification("Product Added Successfully");
                        this.isCreatingPost = !this.isCreatingPost;
                }


            },

            validateForm(){
                if(!this.product.name){
                    this.status = false;
                    this.shownotification("Product Name cannot be empty!");
                    return false;
                }
                if(!this.product.description){
                    this.status = false;
                    this.shownotification("Product Description cannot be empty!");
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
        created: function(){
            this.getCompany()
        },

        computed: {
            ...mapGetters([
                'lasts'
            ])
        }
    }
</script>
