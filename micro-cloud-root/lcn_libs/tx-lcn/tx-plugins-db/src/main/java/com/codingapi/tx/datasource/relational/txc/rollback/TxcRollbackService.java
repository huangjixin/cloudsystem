package com.codingapi.tx.datasource.relational.txc.rollback;


import com.codingapi.tx.datasource.relational.txc.parser.CommitInfo;

public interface TxcRollbackService {



    void rollback(CommitInfo commitInfo);
}
