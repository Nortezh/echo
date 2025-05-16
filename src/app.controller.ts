import { Controller, Get, Ip, Req, Header, Res } from '@nestjs/common';
import { Request, Response } from 'express';

@Controller()
export class AppController {
  @Get()
  getEcho(
    @Req() request: Request,
    @Ip() ip: string,
    @Res() response: Response,
  ): void {
    // Format all headers from the request
    const headers = Object.entries(request.headers)
      .map(
        ([key, value]) =>
          `${key
            .split('-')
            .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
            .join('-')}: ${Array.isArray(value) ? value.join(', ') : value}`,
      )
      .join('\n');

    const method = request.method;
    const url = request.url;
    const httpVersion = `HTTP/${request.httpVersion}`;

    // Add IP information
    const ipInfo = `X-Forwarded-For: ${request.headers['x-forwarded-for'] || ip}
X-Forwarded-Proto: ${request.headers['x-forwarded-proto'] || request.protocol}
X-Real-Ip: ${ip}`;

    // Return the formatted HTTP request
    const result = `${method} ${url} ${httpVersion}
${headers}
${ipInfo}`;
    response.setHeader('Content-Type', 'text/plain');
    response.send(result);
  }
}
