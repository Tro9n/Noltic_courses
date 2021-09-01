/**
 * Created by andriilahun on 20.08.2021.
 */

import {api, LightningElement} from 'lwc';

export default class Note extends LightningElement {
    @api text;
    @api key;
}