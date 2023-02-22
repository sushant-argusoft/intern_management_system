create table address(
    
    address_id int primary key auto_increment,
    house_number int not null,
    street_number int not null,
    street_name varchar(100) not null,
    pin_code int not null,
    city_name varchar(50) not null,
    country_name varchar(50) not null

    
);

create table company(
    name varchar(50) not null,
    company_id int primary key auto_increment,
    address_id int not null,
    foreign key (address_id) references address(address_id)
);

create table person(
   
    person_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth date not null,
    address_id int not null,
    foreign key (address_id) references address(address_id)
);

create table mentor(
    mentor_id int primary key auto_increment,
    person_id int not null,
    foreign key (person_id) references person(person_id)
);
create table intern(
    intern_id int primary key auto_increment,
    mentor_id int not null,
    person_id int not null,
    foreign key (mentor_id) references mentor(mentor_id),
    foreign key (person_id) references person(person_id)
);
create table category( 
    c_id int primary key auto_increment,
    category_name varchar(100) not null
);
create table  course(
    course_id int primary key auto_increment,
    course_name varchar(100) not null,
    c_id int not null,
    company_id int not null,
    foreign key(c_id) references category(c_id),
    foreign key(company_id) references company(company_id)
);
create table course_enrolled(
    course_id int not null,
    intern_id int not null,
    foreign key(course_id) references course(course_id),
    foreign key(intern_id) references intern(intern_id)
);