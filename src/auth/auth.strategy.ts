import { Strategy as GoogleStrategy } from 'passport-google-oauth20';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { AuthService } from './auth.service';

@Injectable()
export class GoogleAuthStrategy extends PassportStrategy(GoogleStrategy, 'google') {
  constructor(private readonly authService: AuthService, private readonly configService: ConfigService) {
    super({
      // todo akicha: create a d.ts file with process.env type
      clientID: configService.get('GOOGLE_OAUTH_CLIENT_ID'), // process.env.GOOGLE_OAUTH_CLIENT_ID,
      clientSecret: configService.get('GOOGLE_OAUTH_CLIENT_SECRET'), // process.env.GOOGLE_OAUTH_CLIENT_SECRET,
      callbackURL: 'http://localhost:3000/auth/google/callback', // Your callback URL
      passReqToCallback: true,
      scope: ['email'],
    });
  }

  async validate(request: any, accessToken: string, refreshToken: string, profile: unknown, done: any) {
    const user = await this.authService.validateGoogleUser(profile);
    done(null, user);
  }
}
