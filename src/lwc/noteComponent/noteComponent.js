/**
 * Created by andriilahun on 24.08.2021.
 */

import {LightningElement, track} from 'lwc';

export default class NoteComponent extends LightningElement {
    @track arr = [];
    @track count = 0;
    @track note;

    handleButtonClick() {
        this.count++;
        this.arr.push({key: 'note #' + this.count, value: this.note});
        console.log(JSON.parse(JSON.stringify(this.arr)));
    }

    handleFormChange(event) {
        this.note = event.target.value;
    }

}