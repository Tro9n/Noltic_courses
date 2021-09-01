/**
 * Created by User on 8/25/2021.
 */

import {LightningElement, track, api} from 'lwc';
import getListCountRecord from '@salesforce/apex/countRecord.getListCountRecord';
import deleteContacts from '@salesforce/apex/countRecord.deleteContacts';

export default class NumberComponent extends LightningElement {


    @track contacts;
    @api count;
    @track error;


    handleGetCountContact() {
        getListCountRecord()
            .then(result => {
                this.contacts = result;
                this.count = this.contacts.length;

            })

    }

    handleRemoveAll(){
        deleteContacts()
            .then(result => {
                this.contacts = result;
                this.count = this.contacts.length;
                console.log('delete')
            })
            .catch(error => {
                this.error = error;
                console.log('Not delete')
                console.log(error)

            });



    }


}








