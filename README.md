# _EpiSalon_

##### _This application is for a salon owner to keep track of stylists and clients, 8/21/15_

#### By _**Alyssa Horrocks**_

## Description

_FAIR WARNING!!!!: Due to technical difficulties on my own laptop I was not able to begin until after noon!! The navigation isn't great! Currently you cannot add a client's stylist until that stylist is already added to the list. Got too rushed to finish integration specs! Nevertheless, you can create, view, update, and delete both stylists and clients with this application!_

## Setup

* in PSQL:
* CREATE DATABASE hair_salon;
* CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
* CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
* CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

_This application depends on Ruby version 2.2 and Sinatra as a framework._

## Technologies Used

_This app uses Ruby, Sinatra, and a bootswatch template as well as the gems: Sinatra, Sinatra-Contrib, and PG._

### Legal

Copyright (c) 2015 **_{Alyssa Horrocks}_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
