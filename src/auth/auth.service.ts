import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { UserService } from '../user/user.service';

@Injectable()
export class AuthService {
  constructor(private readonly userService: UserService) {
  }
  async validateGoogleUser(profile: unknown) {
    // @ts-ignore
    const email = profile.emails[0]?.value
    if (!profile || !email) {
      throw new HttpException('Google OAuth Response is Invalid', HttpStatus.BAD_REQUEST)
    }
    // todo akicha: see where types can be found
    const user = await this.userService.user({ email });
    if (!user) {
      return await this.userService.createUser({ email })
    }
    return user;
  }
}
