import { Component } from '@angular/core';
import { TokenStorageService } from 'src/app/services/token-storage.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-persone',
  templateUrl: './persone.component.html',
  styleUrls: ['./persone.component.css']
})
export class PersoneComponent {
  persone:any;
  isLoggedIn = false;

  constructor(private rest: UserService, private token: TokenStorageService) { }

  ngOnInit(){
    this.getPersone();
    this.isLoggedIn = !!this.token.getToken();
  }

  getPersone(){
    const onSuccess= (response:any)=>this.persone = response;
    return this.rest.getPersone().subscribe(onSuccess);
  }

}

