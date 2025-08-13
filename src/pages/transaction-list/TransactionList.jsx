import React, { useMemo, useState } from 'react';
import { transactions } from '../../common/mockData';
import DataTable from '../../common/components/DataTable';
import BackToDashboard from '../../common/components/BackToDashboard'

export default function TransactionList() {
  const [status, setStatus] = useState('All');
  const rows = useMemo(()=> status==='All' ? transactions : transactions.filter(t=>t.status===status), [status]);
  const columns = [
    { key:'id', header:'ID' },
    { key:'date', header:'Date' },
    { key:'type', header:'Type' },
    { key:'employeeId', header:'Employee' },
    { key:'currency', header:'CCY' },
    { key:'amount', header:'Amount' },
    { key:'status', header:'Status' }
  ];

  return (
    <div className="d-grid gap-3">
      <div className="card card-shadow p-3">
        <div className="d-flex justify-content-between align-items-center">
          <h2 className="h5 mb-0">Transactions</h2>
          <div className="d-flex gap-2">
            <select className="form-select form-select-sm" value={status} onChange={e=>setStatus(e.target.value)}>
              {['All','Draft','Pending Approval','Approved'].map(s=><option key={s}>{s}</option>)}
            </select>
          </div>
        </div>
      </div>
      <DataTable
        columns={columns}
        rows={rows}
        actions={(r)=>(
          <>
            <button className="btn btn-sm btn-outline-primary me-2" onClick={()=>alert('View ' + r.id)}>View</button>
            <button className="btn btn-sm btn-outline-secondary me-2" onClick={()=>alert('Edit ' + r.id)}>Edit</button>
            <button className="btn btn-sm btn-outline-danger" onClick={()=>alert('Delete (mock) ' + r.id)}>Delete</button>
          </>
        )}
      />
      <BackToDashboard />
    </div>
  );
}