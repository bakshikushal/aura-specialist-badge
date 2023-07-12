import { LightningElement } from 'lwc';

export default class SelectAccPicklists extends LightningElement {
    selectedCity = 'All Cities';
    selectedIndustry= 'All Industries';
    selectedOrg = '';
    cityOptions=[
        { label: 'All Cities', value: ''},
        { label: 'Mumbai', value: 'Mumbai'},
        { label: 'Delhi', value: 'Delhi'},
        { label: 'Indore', value: 'Indore'},
        { label: 'Carmel', value: 'Carmel'},
        { label: 'Indianapolis', value: 'Indianapolis'}
    ];

    industryOptions=[
        {label:'All Industries', value:''},
        {label:'Agriculture', value:'Agriculture'},
        {label:'Communications', value:'Communications'},
        {label:'Construction', value:'Construction'},
        {label:'Banking', value:'Banking'},
        {label:'Education', value:'Education'}        
    ];

    orgOptions = [
        {label : 'Select Org', value : ''},
        {label : 'Kushal Org', value : 'kushal'},
        {label : 'Kushaff Org', value : 'kushaff'}
    ]

    handleOrgChange(event){
        this.selectedOrg = event.target.value 
        var evt = new CustomEvent('orgselect', {
            detail : this.selectedOrg
        });
        this.dispatchEvent(evt);
    }

    handleCityChange(event){
        this.selectedCity = event.target.value;
        var evt = new CustomEvent('cityselect',{
            detail: this.selectedCity
        });
        this.dispatchEvent(evt);
    }

    handleIndChange(event){
        this.selectedIndustry = event.target.value;
        var evt = new CustomEvent('indselect',{
            detail : this.selectedIndustry
        });
        this.dispatchEvent(evt);
    }
    
    callRestService(){
        var evt = new CustomEvent('callrest');
        this.dispatchEvent(evt);
    }  


}