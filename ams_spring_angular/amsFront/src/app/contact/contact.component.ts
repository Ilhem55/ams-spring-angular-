import { Component } from '@angular/core';

@Component({
  selector: 'app-contact',
  standalone: true,
  imports: [],
  templateUrl: './contact.component.html',
  styleUrl: './contact.component.css'
})
export class ContactComponent {

  nom:string="Formulaire de contact";
  logo:string = "data:image/png;base64,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";


  info(){
    alert("Hello SIP ACADEMY");
    console.log("Hello World");
  }

}
