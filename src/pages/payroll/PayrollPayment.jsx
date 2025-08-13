import React, { useState } from 'react';
import { accounts } from '../../common/mockData';
import { currencies } from '../../common/constants';
import PrimaryButton from '../../common/components/PrimaryButton';
import FormInput from '../../common/components/FormInput';
import BackToDashboard from '../../common/components/BackToDashboard'

export default function PayrollPayment() {
  const [form, setForm] = useState({
    accountId: accounts[0].id, employeeId: '', amount: '', currency: 'INR', date: ''
  });
  const update = (k,v)=>setForm(f=>({...f,[k]:v}));

  const saveDraft = ()=> alert('Saved as Draft (mock): ' + JSON.stringify(form,null,2));
  const submit = ()=> alert('Submitted (mock): ' + JSON.stringify(form,null,2));

  return (
    <div className="card card-shadow p-4">
      <h2 className="h5">Create PAY (Payroll)</h2>
      <div className="row">
        <div className="col-md-6">
          <div className="mb-3">
            <label className="form-label">From Account *</label>
            <select className="form-select" value={form.accountId} onChange={e=>update('accountId', e.target.value)}>
              {accounts.map(a => <option key={a.id} value={a.id}>{a.name} ({a.currency})</option>)}
            </select>
          </div>
          <FormInput label="Employee ID" value={form.employeeId} onChange={v=>update('employeeId',v)} required />
          <FormInput label="Amount" type="number" value={form.amount} onChange={v=>update('amount',v)} required />
          <div className="mb-3">
            <label className="form-label">Currency *</label>
            <select className="form-select" value={form.currency} onChange={e=>update('currency', e.target.value)}>
              {currencies.map(c => <option key={c}>{c}</option>)}
            </select>
          </div>
          <FormInput label="Payment Date" type="date" value={form.date} onChange={v=>update('date',v)} required />
        </div>
      </div>
      <div className="d-flex gap-2">
        <button className="btn btn-outline-secondary" onClick={saveDraft}>Save as Draft</button>
        <PrimaryButton onClick={submit}>Submit</PrimaryButton>
      </div>
      <BackToDashboard />
    </div>
  );
}