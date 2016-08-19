# TeaHub project
# Initial evolution to create the tables in the database

# --- Ups!
create type UserRole as enum ('user', 'lead', 'admin' );
create type UserStatus as enum ('disabled','enabled');

create table users (
    Id              serial not null primary key,
    GitHubUser      varchar not null unique,
    GitHubToken     varchar,
    Name            varchar not null,
    Email           varchar,
    Role            UserRole not null default 'user',
    Status          UserStatus not null default 'disabled'
);

create table projects (
    Id              serial not null primary key,
    GitHubRepo      varchar not null unique,
    TogglProject    varchar,
    Name            varchar not null
);

create table user2project (
    UserId          integer not null,
    ProjectId       integer not null,
    Role            UserRole not null default 'user',
    Status          UserStatus not null default 'disabled',
    primary key (UserId, ProjectId),
    foreign key (UserId) references users (Id) on delete cascade,
    foreign key (ProjectId) references projects (Id) on delete cascade
);

create table issues (
    Id              serial not null primary key,
    ProjectId       integer not null,
    GitHubIssueId   integer not null,
    Title           varchar not null,
    Estimate        integer,
    foreign key (ProjectId) references projects (Id) on delete cascade
); 


# --- Downs!

drop table issues;
drop table user2project
drop table projects;
drop table users;

