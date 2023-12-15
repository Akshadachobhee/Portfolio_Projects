create table admin(
	admin_id varchar(30) primary key,
	admin_pwd varchar(30) not null,
	admin_name varchar(50) not null
);

insert into admin values('admin','admin','Vaishnavi Nipunge');

create table category(
	cat_id int auto_increment primary key,
	cat_desc text,
	cat_path text
);

insert into category(cat_desc, cat_path) values ('Plumber','plumber.png'),('Photographer','photographer.png'),('Painter','painter.png'),('Electrician','electrician.png'),('Doctor','doctor.png'),('Architect','architect.png');

create table security_questions(
	security_id int auto_increment primary key,
	security_qtn text
);

insert into security_questions(security_qtn) values('First Car'),('First School'),('First Fridge'),('First Bike'),('Favourite Color');

create table service_provider(
	email varchar(30) primary key,
	passwd varchar(30) not null,
	company_name varchar(100),
	address text,
	phone text,
	cat_id int references category(cat_id),
	security_id int references security_questions(security_id),
	security_ans text not null,
	active int
);

create table photos(
	photo_id int auto_increment primary key,
	photo_path text,
	email text references service_provider(email)
);

create table comments(
	comment_id int auto_increment primary key,
	provider_email text references service_provider(email),
	guest_name text,
	guest_email text,
	comment_msg text,
	comment_date date
);



