class sequence_2 extends base_sequence;
  `uvm_object_utils(sequence_2)
  `uvm_add_to_seq_lib(sequence_2, wb_master_seqr_sequence_library)
  
  function new(string name = "seq_2");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req, {address == 22; kind == wb_transaction::WRITE;})
  endtask
endclass
