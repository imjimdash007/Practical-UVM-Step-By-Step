class wb_env_test_priority extends wb_env_base_test;
  `uvm_component_utils(wb_env_test_priority)
  
  function new(string name="wb_env_test_priority", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Set sequence_3 (the priority sequence) as the default
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.run_phase", "default_sequence", sequence_3::get_type());
  endfunction
endclass
