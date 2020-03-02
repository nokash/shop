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
                        <div class="form-group">
                            <hr>
                            <input class='form-control' v-model="company" placeholder="Enter Company Name">
                            <br>


                        </div>

                    </div>
                    <div class="card-footer">
                             <button type="button"
                             @click="createCompany"
                             class="btn btn-success">
                             {{ isCreatingPost ? "Posting..." : "Create Post" }}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { setTimeout } from "timers";
import { mapState, mapActions } from "vuex";

export default {
        mounted() {
            console.log('Component mounted.')
        },
        props: ["suppliers"],

        data(){
            return {
                company: "",
                status: "",
                status_msg: "",
                isCreatingPost: false,

            };
        },

        computed:{},
        mounted(){},
        methods:{
            getCompany: function(){
              window.axios.get('/api/supplier/all')
              .then(function (response) {
                 this.companies = response.data;
              }.bind(this));

            },

            ...mapActions(["getSuppliers"]),

            createCompany(e) {
                e.preventDefault();
                if(!this.validateForm()){
                    return false;
                }
                const that = this;
                this.isCreatingPost = true;
                let formData = new FormData();

                formData.append("name", this.company);

                window.axios.post("/api/supplier/add", formData, {
                    headers: { "Content-Type": "multipart/form-data"}
                }).then(res => {
                    this.company = "";
                    this.status = true;
                    this.shownotification("Supplier Added Successfully");
                    this.isCreatingPost = !this.isCreatingPost;
                    that.getCompany();
                });
            },
            validateForm(){
                if(!this.company){
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
            // getStates: function() {
            //     axios.get('/api/getStates',{
            //      params: {
            //        country_id: this.country
            //      }
            //   }).then(function(response){
            //         this.states = response.data;
            //     }.bind(this));
            // }
        },
        created: function(){
            this.getCompany()
        }
};
</script>
