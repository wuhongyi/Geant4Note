<!-- G4CascadeDeexcitation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 12:21:39 2018 (+0800)
;; Last-Updated: 六 9月  1 12:24:34 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4CascadeDeexcitation 

**public G4CascadeDeexciteBase**

Takes an arbitrary excited or unphysical nuclear state and produces a final state with evaporated particles and (possibly) a stable nucleus.

```cpp
  virtual void setVerboseLevel(G4int verbose);

  // Interface specific to pre-compound (post-cascade) processing
  virtual void deExcite(const G4Fragment& fragment, G4CollisionOutput& globalOutput);
```

- G4BigBanger
- G4NonEquilibriumEvaporator
- G4EquilibriumEvaporator


## class

```cpp
public:
  G4CascadeDeexcitation();
  virtual ~G4CascadeDeexcitation();

  virtual void setVerboseLevel(G4int verbose);

  // Interface specific to pre-compound (post-cascade) processing
  virtual void deExcite(const G4Fragment& fragment,
			G4CollisionOutput& globalOutput);

private:
  G4BigBanger* theBigBanger;
  G4NonEquilibriumEvaporator* theNonEquilibriumEvaporator;
  G4EquilibriumEvaporator* theEquilibriumEvaporator;

  G4CollisionOutput tempOutput;	// Local buffer for de-excitation stages

private:
  // Copying of modules is forbidden
  G4CascadeDeexcitation(const G4CascadeDeexcitation&);
  G4CascadeDeexcitation& operator=(const G4CascadeDeexcitation&);
```

<!-- G4CascadeDeexcitation.md ends here -->
