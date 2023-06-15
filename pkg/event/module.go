package event

type Module struct {
	statusEventManager *StatusEventManager
}

func NewEventModule(sem *StatusEventManager) *Module {
	return &Module{
		statusEventManager: sem,
	}
}

func (m *Module) StatusEventManager() *StatusEventManager {
	return m.statusEventManager
}
