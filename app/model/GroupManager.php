<?php
namespace App;

class GroupManager extends BaseManager
{
	public function getBySlug($slug)
	{
		return $this->selectionFactory->table('groups')->where(':slugs.slug', $slug)->fetch();
	}

	public function getAll()
	{
		return $this->selectionFactory->table('groups')->fetchAll();
	}

	public function getMembers($groupId)
	{
		$members = $this->selectionFactory->table('users')->order('RAND()')->fetchAll();
		return array_slice($members, 0, rand(0, count($members)));
	}
}
