package event

import (
	"sync"

	"systems.panta/rpc-microblog/pkg/entity"
)

type EventType string

const (
	StatusCreate EventType = "status.create"
	StatusUpdate EventType = "status.update"
	StatusDelete EventType = "status.delete"
)

type StatusEvent struct {
	EventType EventType
	Post      *entity.Status
}

type StatusClient struct {
	EventChannel chan *StatusEvent
}

type StatusEventManager struct {
	clients map[string]*StatusClient
	mutex   sync.RWMutex
}

func (r *StatusEventManager) PublishEvent(event *StatusEvent) {
	r.mutex.RLock()
	defer r.mutex.RUnlock()
	for _, client := range r.clients {
		client.EventChannel <- event
	}
}

func (r *StatusEventManager) Register(id string, client *StatusClient) {
	r.mutex.RLock()
	defer r.mutex.RUnlock()
	r.clients[id] = client
}

func (r *StatusEventManager) Unregister(id string) {
	r.mutex.RLock()
	defer r.mutex.RUnlock()
	delete(r.clients, id)
}

func NewStatusEventmanager() *StatusEventManager {
	return &StatusEventManager{
		clients: make(map[string]*StatusClient),
		mutex:   sync.RWMutex{},
	}
}
