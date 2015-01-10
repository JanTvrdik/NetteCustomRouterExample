<?php
namespace App;

class GroupManager extends BaseManager
{
	public function getBySlug($slug)
	{
		return $this->db->table('groups')->where(':slugs.slug', $slug)->fetch();
	}

	public function getAll()
	{
		return $this->db->table('groups')->fetchAll();
	}

	public function getMembers($groupId)
	{
		$members = $this->db->table('users')->order('RAND()')->fetchAll();
		return array_slice($members, 0, rand(0, count($members)));
	}
}
