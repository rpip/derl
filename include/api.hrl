%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.8.0

-ifndef(api).
-define(api, true).

-define(api_gpb_version, "4.8.0").

-ifndef('REQUEST_PB_H').
-define('REQUEST_PB_H', true).
-record('Request',
        {query = []             :: iodata() | undefined, % = 1
         vars = []              :: [{iodata(), iodata()}] | undefined, % = 2
         start_ts = 0           :: non_neg_integer() | undefined, % = 13, 32 bits
         lin_read = undefined   :: api:'LinRead'() | undefined, % = 14
         read_only = false      :: boolean() | 0 | 1 | undefined, % = 15
         best_effort = false    :: boolean() | 0 | 1 | undefined % = 16
        }).
-endif.

-ifndef('RESPONSE_PB_H').
-define('RESPONSE_PB_H', true).
-record('Response',
        {json = <<>>            :: iodata() | undefined, % = 1
         schema = []            :: [api:'SchemaNode'()] | undefined, % = 2
         txn = undefined        :: api:'TxnContext'() | undefined, % = 3
         latency = undefined    :: api:'Latency'() | undefined % = 12
        }).
-endif.

-ifndef('ASSIGNED_PB_H').
-define('ASSIGNED_PB_H', true).
-record('Assigned',
        {uids = []              :: [{iodata(), iodata()}] | undefined, % = 1
         context = undefined    :: api:'TxnContext'() | undefined, % = 2
         latency = undefined    :: api:'Latency'() | undefined % = 12
        }).
-endif.

-ifndef('MUTATION_PB_H').
-define('MUTATION_PB_H', true).
-record('Mutation',
        {set_json = <<>>        :: iodata() | undefined, % = 1
         delete_json = <<>>     :: iodata() | undefined, % = 2
         set_nquads = <<>>      :: iodata() | undefined, % = 3
         del_nquads = <<>>      :: iodata() | undefined, % = 4
         query = []             :: iodata() | undefined, % = 5
         set = []               :: [api:'NQuad'()] | undefined, % = 10
         del = []               :: [api:'NQuad'()] | undefined, % = 11
         start_ts = 0           :: non_neg_integer() | undefined, % = 13, 32 bits
         commit_now = false     :: boolean() | 0 | 1 | undefined, % = 14
         ignore_index_conflict = false :: boolean() | 0 | 1 | undefined % = 15
        }).
-endif.

-ifndef('OPERATION_PB_H').
-define('OPERATION_PB_H', true).
-record('Operation',
        {schema = []            :: iodata() | undefined, % = 1
         drop_attr = []         :: iodata() | undefined, % = 2
         drop_all = false       :: boolean() | 0 | 1 | undefined, % = 3
         drop_op = 'NONE'       :: 'NONE' | 'ALL' | 'DATA' | 'ATTR' | 'TYPE' | integer() | undefined, % = 4, enum Operation.DropOp
         drop_value = []        :: iodata() | undefined % = 5
        }).
-endif.

-ifndef('PAYLOAD_PB_H').
-define('PAYLOAD_PB_H', true).
-record('Payload',
        {'Data' = <<>>          :: iodata() | undefined % = 1
        }).
-endif.

-ifndef('TXNCONTEXT_PB_H').
-define('TXNCONTEXT_PB_H', true).
-record('TxnContext',
        {start_ts = 0           :: non_neg_integer() | undefined, % = 1, 32 bits
         commit_ts = 0          :: non_neg_integer() | undefined, % = 2, 32 bits
         aborted = false        :: boolean() | 0 | 1 | undefined, % = 3
         keys = []              :: [iodata()] | undefined, % = 4
         preds = []             :: [iodata()] | undefined, % = 5
         lin_read = undefined   :: api:'LinRead'() | undefined % = 13
        }).
-endif.

-ifndef('CHECK_PB_H').
-define('CHECK_PB_H', true).
-record('Check',
        {
        }).
-endif.

-ifndef('VERSION_PB_H').
-define('VERSION_PB_H', true).
-record('Version',
        {tag = []               :: iodata() | undefined % = 1
        }).
-endif.

-ifndef('LINREAD_PB_H').
-define('LINREAD_PB_H', true).
-record('LinRead',
        {ids = []               :: [{non_neg_integer(), non_neg_integer()}] | undefined, % = 1
         sequencing = 'CLIENT_SIDE' :: 'CLIENT_SIDE' | 'SERVER_SIDE' | integer() | undefined % = 2, enum LinRead.Sequencing
        }).
-endif.

-ifndef('LATENCY_PB_H').
-define('LATENCY_PB_H', true).
-record('Latency',
        {parsing_ns = 0         :: non_neg_integer() | undefined, % = 1, 32 bits
         processing_ns = 0      :: non_neg_integer() | undefined, % = 2, 32 bits
         encoding_ns = 0        :: non_neg_integer() | undefined % = 3, 32 bits
        }).
-endif.

-ifndef('NQUAD_PB_H').
-define('NQUAD_PB_H', true).
-record('NQuad',
        {subject = []           :: iodata() | undefined, % = 1
         predicate = []         :: iodata() | undefined, % = 2
         object_id = []         :: iodata() | undefined, % = 3
         object_value = undefined :: api:'Value'() | undefined, % = 4
         label = []             :: iodata() | undefined, % = 5
         lang = []              :: iodata() | undefined, % = 6
         facets = []            :: [api:'Facet'()] | undefined % = 7
        }).
-endif.

-ifndef('VALUE_PB_H').
-define('VALUE_PB_H', true).
-record('Value',
        {val                    :: {default_val, iodata()} | {bytes_val, iodata()} | {int_val, integer()} | {bool_val, boolean() | 0 | 1} | {str_val, iodata()} | {double_val, float() | integer() | infinity | '-infinity' | nan} | {geo_val, iodata()} | {date_val, iodata()} | {datetime_val, iodata()} | {password_val, iodata()} | {uid_val, non_neg_integer()} | undefined % oneof
        }).
-endif.

-ifndef('FACET_PB_H').
-define('FACET_PB_H', true).
-record('Facet',
        {key = []               :: iodata() | undefined, % = 1
         value = <<>>           :: iodata() | undefined, % = 2
         val_type = 'STRING'    :: 'STRING' | 'INT' | 'FLOAT' | 'BOOL' | 'DATETIME' | integer() | undefined, % = 3, enum Facet.ValType
         tokens = []            :: [iodata()] | undefined, % = 4
         alias = []             :: iodata() | undefined % = 5
        }).
-endif.

-ifndef('SCHEMANODE_PB_H').
-define('SCHEMANODE_PB_H', true).
-record('SchemaNode',
        {predicate = []         :: iodata() | undefined, % = 1
         type = []              :: iodata() | undefined, % = 2
         index = false          :: boolean() | 0 | 1 | undefined, % = 3
         tokenizer = []         :: [iodata()] | undefined, % = 4
         reverse = false        :: boolean() | 0 | 1 | undefined, % = 5
         count = false          :: boolean() | 0 | 1 | undefined, % = 6
         list = false           :: boolean() | 0 | 1 | undefined, % = 7
         upsert = false         :: boolean() | 0 | 1 | undefined, % = 8
         lang = false           :: boolean() | 0 | 1 | undefined % = 9
        }).
-endif.

-ifndef('LOGINREQUEST_PB_H').
-define('LOGINREQUEST_PB_H', true).
-record('LoginRequest',
        {userid = []            :: iodata() | undefined, % = 1
         password = []          :: iodata() | undefined, % = 2
         refresh_token = []     :: iodata() | undefined % = 3
        }).
-endif.

-ifndef('JWT_PB_H').
-define('JWT_PB_H', true).
-record('Jwt',
        {access_jwt = []        :: iodata() | undefined, % = 1
         refresh_jwt = []       :: iodata() | undefined % = 2
        }).
-endif.

-endif.