<?php
namespace App;

class EventManager extends BaseManager
{
	public function getBySlug($slug)
	{
		return $this->db->table('events')->where(':slugs.slug', $slug)->fetch();
	}

	public function getAll()
	{
		return $this->db->table('events')->fetchAll();
	}
}
