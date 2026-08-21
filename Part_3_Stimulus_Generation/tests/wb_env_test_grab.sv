class wb_env_test_grab extends wb_env_base_test;
  `uvm_component_utils(wb_env_test_grab)
  
  function new(string name="wb_env_test_grab", uvm_component parent=null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Override the default sequence so we can manually fork them
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.master_agent.mast_sqr.run_phase", "default_sequence", null);
  endfunction

  virtual task run_phase(uvm_phase phase);
    sequence_0 seq0 = sequence_0::type_id::create("seq0");
    grab_sequence seq_grab = grab_sequence::type_id::create("seq_grab");

    phase.raise_objection(this);
    fork
      seq0.start(env.master_agent.mast_sqr); // Starts normal traffic
      begin
        #50; 
        seq_grab.start(env.master_agent.mast_sqr); // Interrupts the traffic!
      end
    join
    phase.drop_objection(this);
  endtask
endclass
