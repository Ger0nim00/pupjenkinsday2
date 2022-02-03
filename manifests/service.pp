class jenkins::service inherits jenkins{

  service{'jenkins':
    ensure   =>  running,
  }
}
