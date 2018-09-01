<!-- G4CascadeDeexciteBase.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 12:12:28 2018 (+0800)
;; Last-Updated: 六 9月  1 12:13:55 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4CascadeDeexciteBase

**public G4VCascadeDeexcitation**

Semi-concrete base class for de-excitation modules, analogous to G4CascadeColliderBase.

## class

```cpp
public:
  G4CascadeDeexciteBase(const char* name);
  virtual ~G4CascadeDeexciteBase();

  virtual void setVerboseLevel(G4int verbose=0);

protected:
  // Decide whether to use G4BigBanger or not
  virtual G4bool explosion(const G4Fragment& target) const;
  virtual G4bool explosion(G4int A, G4int Z, G4double excitation) const;

protected:
  G4CascadeCheckBalance* balance;	// For conservation checking

  // ==> Provide interfaces to G4CascadeCheckBalance
  virtual G4bool validateOutput(const G4Fragment& target,
				G4CollisionOutput& output);

  // This is for use with G4BigBanger
  virtual G4bool validateOutput(const G4Fragment& target,
		const std::vector<G4InuclElementaryParticle>& particles);

  // This is for use with G4Fissioner
  virtual G4bool validateOutput(const G4Fragment& target,
				const std::vector<G4InuclNuclei>& fragments);

  // Interfaces between local content and G4Fragment
  void getTargetData(const G4Fragment& target);
  G4int A;		// Buffers to collect target data for all modules
  G4int Z;
  G4LorentzVector PEX;	// Four momentum of recoil in Bertini units (GeV)
  G4double EEXS;	// Excitation energy in MeV
  
  // NOTE:  Momentum passed by value so that energy/mass can be adjusted
  const G4Fragment& makeFragment(G4LorentzVector mom, G4int A, G4int Z,
				 G4double EX=0.);
  const G4Fragment& makeFragment(G4int A, G4int Z, G4double EX=0.);
  G4Fragment aFragment;	// Reusable buffer to reduce new/delete cycling

private:
  // Copying of modules is forbidden
  G4CascadeDeexciteBase(const G4CascadeDeexciteBase&);
  G4CascadeDeexciteBase& operator=(const G4CascadeDeexciteBase&);
```

<!-- G4CascadeDeexciteBase.md ends here -->
