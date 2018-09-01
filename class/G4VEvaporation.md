<!-- G4VEvaporation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 13:07:24 2018 (+0800)
;; Last-Updated: 六 9月  1 13:10:23 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VEvaporation

Hadronic Process: Nuclear De-excitations interface


## class

```cpp
public:

  explicit G4VEvaporation();
  virtual ~G4VEvaporation(); 

  // vector of products is added to the provided vector
  // primary fragment is deleted or is modified and added to the list
  // of products 
  virtual void BreakFragment(G4FragmentVector*, G4Fragment* theNucleus);

  // definition of options
  virtual void InitialiseChannels();

  virtual void SetPhotonEvaporation(G4VEvaporationChannel* ptr);

  inline void SetFermiBreakUp(G4VFermiBreakUp* ptr);

  inline G4VFermiBreakUp* GetFermiBreakUp() const;
  inline G4VEvaporationChannel* GetPhotonEvaporation();
  inline G4VEvaporationChannel* GetFissionChannel();

  // for inverse cross section choice
  inline void SetOPTxs(G4int opt); 
  // for superimposed Coulomb Barrier for inverse cross sections 	
  inline void UseSICB(G4bool use);

  inline size_t GetNumberOfChannels() const;

protected:

  void CleanChannels();

  G4VEvaporationChannel* thePhotonEvaporation;
  G4VFermiBreakUp* theFBU; 

  G4int OPTxs;
  G4bool useSICB;

  std::vector<G4VEvaporationChannel*> * theChannels;
  G4VEvaporationFactory * theChannelFactory;

private:  
  G4VEvaporation(const G4VEvaporation &right) = delete;
  const G4VEvaporation & operator=(const G4VEvaporation &right) = delete;
  G4bool operator==(const G4VEvaporation &right) const = delete;
  G4bool operator!=(const G4VEvaporation &right) const = delete;
```

<!-- G4VEvaporation.md ends here -->
