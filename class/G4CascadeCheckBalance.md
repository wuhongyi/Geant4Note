<!-- G4CascadeCheckBalance.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 11:32:00 2018 (+0800)
;; Last-Updated: 六 9月  1 11:33:21 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4CascadeCheckBalance

**public G4VCascadeCollider**


Verify and report four-momentum conservation for collision output; uses same interface as collision generators.

## class

```cpp
public:
  static const G4double tolerance;	// Don't do floating zero!

  explicit G4CascadeCheckBalance(const G4String& owner="G4CascadeCheckBalance");

  G4CascadeCheckBalance(G4double relative, G4double absolute,
			const G4String& owner="G4CascadeCheckBalance");
  virtual ~G4CascadeCheckBalance() {};

  void setOwner(const G4String& owner) { setName(owner); }

  void setLimits(G4double relative, G4double absolute) {
    setRelativeLimit(relative);
    setAbsoluteLimit(absolute);
  }

  void setRelativeLimit(G4double limit) { relativeLimit = limit; }
  void setAbsoluteLimit(G4double limit) { absoluteLimit = limit; }

  void collide(G4InuclParticle* bullet, G4InuclParticle* target,
	       G4CollisionOutput& output);

  // This is for use with G4VCascadeDeexcitation modules
  void collide(const G4Fragment& fragment, G4CollisionOutput& output);

  // This is for use with G4EPCollider internal checks
  void collide(G4InuclParticle* bullet, G4InuclParticle* target,
	       const std::vector<G4InuclElementaryParticle>& particles);

  // This is for use with G4NucleiModel internal checks
  void collide(G4InuclParticle* bullet, G4InuclParticle* target,
	       const std::vector<G4CascadParticle>& particles);

  // This is for use with G4IntraNucleiCascader
  void collide(G4InuclParticle* bullet, G4InuclParticle* target,
	       G4CollisionOutput& output,
	       const std::vector<G4CascadParticle>& cparticles);

  // This is for use with G4BigBanger internal checks
  void collide(const G4Fragment& target,
	       const std::vector<G4InuclElementaryParticle>& particles);

  // This is for use with G4Fissioner internal checks
  void collide(const G4Fragment& target,
	       const std::vector<G4InuclNuclei>& fragments);

  // Checks on conservation laws (kinematics, baryon number, charge, hyperons)
  G4bool energyOkay() const;
  G4bool ekinOkay() const;
  G4bool momentumOkay() const;
  G4bool baryonOkay() const;
  G4bool chargeOkay() const;
  G4bool strangeOkay() const;

  // Global check, used by G4CascadeInterface validation loop
  // NOTE:  Strangeness is not required to be conserved in final state
  G4bool okay() const { return (energyOkay() && momentumOkay() &&
				baryonOkay() && chargeOkay()); }

  // Calculations of conserved quantities from initial and final state
  // FIXME:  Relative comparisons don't work for zero!
  G4double deltaE() const { return (final.e() - initial.e()); }
  G4double relativeE() const {
    return ( (std::abs(deltaE())<tolerance) ? 0. : 
	     (initial.e()<tolerance) ? 1. : deltaE()/initial.e() );
  }

  G4double deltaKE() const { return (ekin(final) - ekin(initial)); }
  G4double relativeKE() const {
    return ( (std::abs(deltaKE())<tolerance) ? 0. : 
	     (ekin(initial)<tolerance) ? 1. : deltaKE()/ekin(initial) );
  }

  G4double deltaP() const { return deltaLV().rho(); }
  G4double relativeP() const {
    return ( (std::abs(deltaP())<tolerance) ? 0. : 
	     (initial.rho()<tolerance) ? 1. : deltaP()/initial.rho() );
  }

  G4LorentzVector deltaLV() const { return final - initial; }

  // Baryon number, charge, S are discrete; no bounds and no "relative" scale
  G4int deltaB() const { return (finalBaryon - initialBaryon); }
  G4int deltaQ() const { return (finalCharge - initialCharge); }
  G4int deltaS() const { return (finalStrange- initialStrange); }

protected:
  // Utility function for kinetic energy
  G4double ekin(const G4LorentzVector& p) const { return (p.e() - p.m()); }

private:
  G4double relativeLimit;	// Fractional bound on conservation
  G4double absoluteLimit;	// Absolute (GeV) bound on conservation

  G4LorentzVector initial;	// Four-vectors for computing violations
  G4LorentzVector final;

  G4int initialBaryon;		// Total baryon number
  G4int finalBaryon;

  G4int initialCharge;		// Total charge
  G4int finalCharge;

  G4int initialStrange;		// Total strangeness (s-quark content)
  G4int finalStrange;

  G4CollisionOutput tempOutput;		// Buffer for direct-list interfaces

private:
  // Copying of modules is forbidden
  G4CascadeCheckBalance(const G4CascadeCheckBalance&);
  G4CascadeCheckBalance& operator=(const G4CascadeCheckBalance&);
```

<!-- G4CascadeCheckBalance.md ends here -->
