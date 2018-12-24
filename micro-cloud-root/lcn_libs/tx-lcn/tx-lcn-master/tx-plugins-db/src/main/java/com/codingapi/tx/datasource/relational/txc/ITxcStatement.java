package com.codingapi.tx.datasource.relational.txc;

import java.sql.Statement;


public interface ITxcStatement extends Statement {

    String getSql();

    Statement getStatement();

    AbstractTxcConnection getTxcDBConnection();

}
