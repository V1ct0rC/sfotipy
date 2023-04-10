import { Component, OnInit } from '@angular/core';
import { Validators, FormGroup, FormBuilder } from '@angular/forms';

import { CustomvalidationService } from './Validators_extras';

import { Router } from '@angular/router';
import { Usera } from '../../../../common/usera'

import { UserService } from '../user.service';
import { LoginService } from '../login.service';

@Component({
  selector: 'app-cadastro',
  templateUrl: './cadastro.component.html',
  styleUrls: ['./cadastro.component.css']
})
export class RegisterComponent implements OnInit {

  RegisterForm!: FormGroup;
  submitted!: false;

  constructor(
    private fb: FormBuilder,
    private customValidator: CustomvalidationService,
    private registerService: UserService,
    private router: Router,
    private loginService: LoginService,
  ) { }

  ngOnInit(): void {
    this.redirectToHomePage();
    this.RegisterForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      senha: ['', [Validators.required]],
      ConfirmarSenha: ['', [Validators.required]],
      nome: ['', Validators.required],
    },
      {
        validator: this.customValidator.MatchPassword('senha', 'ConfirmarSenha'),
      }
    );
  }

  redirectToHomePage() {
    this.loginService.getLoginStatus().subscribe(isLogged => { //Função que verifica se o usuário está logado. Caso sim, não faz sentido as telas de Login e cadastro
      if (isLogged) {
        this.router.navigate(['']); // Redireciona o usuário para a tela principal caso ele esteja logado
      }
    });
  }

  checkToken() {
    const token = localStorage.getItem('token');
    if (token) {
      this.loginService.updateLoginStatus(true);
    }
  }

  get registerFormControl() {
    return this.RegisterForm.controls;
  }

  get email() {
    return this.RegisterForm.get('email')!;
  }
  get senha() {
    return this.RegisterForm.get('senha')!;
  }
  get ConfirmarSenha() {
    return this.RegisterForm.get('ConfirmarSenha')!;
  }
  get nome() {
    return this.RegisterForm.get('nome')!;
  }

  submit() {

    let data = this.RegisterForm.value;


    if (this.RegisterForm.valid) { // Cria o componente do user para enviar ao servidor
      data = new Usera({
        name: data.nome,
        email: String(data.email).toLowerCase(),
        password: data.senha
      })

      this.registerService.emailExists(data.email).subscribe(
        emailExists => { // Verifica se o email existe
          if (emailExists) {
            this.email.setErrors({ 'emailExists': true });
          } else {
            this.registerService.addUser(data).subscribe(
              ({ user, token }) => {
                localStorage.setItem('token', token); // Armazenando o token no localStorage do navegador
                if (user && user.id !== undefined) {
                  const userId = user.id;
                  this.registerService.setUserId(userId);
                }
                this.loginService.updateLoginStatus(true);
                this.router.navigate(['']);
              }
            )
          }
        }
      )

    } else {
      console.log('envio não efetuado');
    }
  }
}