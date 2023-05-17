import { Component } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { TokenStorageService } from 'src/app/services/token-storage.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  form: any = {
    username: null,
    password: null
  };
  isLoggedIn = false;
  isLoginFailed = false;
  errorMessage = '';
  roles: string[] = [];

  captchaResponse: string = '';
  isCaptchaInvalid: boolean = false;
  siteKey: string = '6LdDBxgmAAAAAH871Lq8CmwXa79b2_1YByKOqfkn';

  constructor(private authService: AuthService, private tokenStorage: TokenStorageService) { }

  onCaptchaResolved(): void {
    this.isCaptchaInvalid = false;
  }

  ngOnInit(): void {
    if (this.tokenStorage.getToken()) {
      this.isLoggedIn = true;
      this.roles = this.tokenStorage.getUser().roles;
    }
  }

  onSubmit(): void {
    const { username, password } = this.form;

    if (!this.captchaResponse) {
      this.isCaptchaInvalid = true;
      return;
    }

    this.authService.login(username, password, this.captchaResponse).subscribe({
      next: data => {
        this.tokenStorage.saveToken(data.accessToken);
        this.tokenStorage.saveUser(data);

        this.isLoginFailed = false;
        this.isLoggedIn = true;
        this.roles = this.tokenStorage.getUser().roles;
        this.reloadPage();
      },
      error: err => {
        this.errorMessage = err.error.message;
        this.isLoginFailed = true;
      }
    });
  }

  reloadPage(): void {
    window.location.reload();
  }
}
