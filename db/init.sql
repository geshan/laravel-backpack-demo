create table failed_jobs
(
    id         bigint unsigned auto_increment
        primary key,
    uuid       varchar(255)                        not null,
    connection text                                not null,
    queue      text                                not null,
    payload    longtext                            not null,
    exception  longtext                            not null,
    failed_at  timestamp default CURRENT_TIMESTAMP not null,
    constraint failed_jobs_uuid_unique
        unique (uuid)
)
    collate = utf8mb4_unicode_ci;

create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table password_resets
(
    email      varchar(255) not null,
    token      varchar(255) not null,
    created_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create index password_resets_email_index
    on password_resets (email);

create table personal_access_tokens
(
    id             bigint unsigned auto_increment
        primary key,
    tokenable_type varchar(255)    not null,
    tokenable_id   bigint unsigned not null,
    name           varchar(255)    not null,
    token          varchar(64)     not null,
    abilities      text            null,
    last_used_at   timestamp       null,
    expires_at     timestamp       null,
    created_at     timestamp       null,
    updated_at     timestamp       null,
    constraint personal_access_tokens_token_unique
        unique (token)
)
    collate = utf8mb4_unicode_ci;

create index personal_access_tokens_tokenable_type_tokenable_id_index
    on personal_access_tokens (tokenable_type, tokenable_id);

create table users
(
    id                bigint unsigned auto_increment
        primary key,
    name              varchar(255) not null,
    email             varchar(255) not null,
    email_verified_at timestamp    null,
    password          varchar(255) not null,
    remember_token    varchar(100) null,
    created_at        timestamp    null,
    updated_at        timestamp    null,
    constraint users_email_unique
        unique (email)
)
    collate = utf8mb4_unicode_ci;


insert into migrations (id, migration, batch)
values  (1, '2014_10_12_000000_create_users_table', 1),
        (2, '2014_10_12_100000_create_password_resets_table', 1),
        (3, '2019_08_19_000000_create_failed_jobs_table', 1),
        (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

insert into users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at)
values  (1, 'test user', 'test@test.com', null, '$2y$10$bXcKxcdPExJR/29r1rZJk.7S8KKwr8Ri.uuN9TirPvB2TLeWQrliq', null, '2022-10-23 20:34:28', '2022-10-23 20:34:28'),
        (2, 'dummy user', 'dummy@user.com', null, 'this-will-not-work', null, '2022-10-23 20:35:25', '2022-10-23 20:35:25');
