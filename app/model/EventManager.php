<?php
namespace App;

class EventManager extends BaseManager
{
	public function getBySlug($slug)
	{
		return $this->selectionFactory->table('events')->where(':slugs.slug', $slug)->fetch();
	}

	public function getAll()
	{
		return $this->selectionFactory->table('events')->fetchAll();
	}
}
