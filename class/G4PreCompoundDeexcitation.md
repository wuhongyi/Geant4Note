<!-- G4PreCompoundDeexcitation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 12:14:20 2018 (+0800)
;; Last-Updated: 六 9月  1 12:20:08 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4PreCompoundDeexcitation

**public G4CascadeDeexciteBase**

Takes an arbitrary excited or unphysical nuclear state and produces a final state with evaporated particles and (possibly) a stable nucleus.

```cpp
  virtual void setVerboseLevel(G4int verbose);

  // Interface specific to pre-compound (post-cascade) processing
  virtual void deExcite(const G4Fragment& fragment, G4CollisionOutput& globalOutput);
```

- G4ExcitationHandler
- G4VPreCompoundModel
	- G4PreCompoundModel


## class

```cpp
public:
  G4PreCompoundDeexcitation();
  virtual ~G4PreCompoundDeexcitation();

  virtual void setVerboseLevel(G4int verbose);

  // Interface specific to pre-compound (post-cascade) processing
  virtual void deExcite(const G4Fragment& fragment,
			G4CollisionOutput& globalOutput);

private:
  G4ExcitationHandler* theExcitationHandler;
  G4VPreCompoundModel* theDeExcitation;

private:
  // Copying of modules is forbidden
  G4PreCompoundDeexcitation(const G4PreCompoundDeexcitation&);
  G4PreCompoundDeexcitation& operator=(const G4PreCompoundDeexcitation&);
```

<!-- G4PreCompoundDeexcitation.md ends here -->
