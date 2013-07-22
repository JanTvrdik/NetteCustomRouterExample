<?php
namespace App;

use Nette;
use Nette\Application\UI;


class GroupsPresenter extends UI\Presenter
{
	/**
	 * @var GroupManager
	 * @inject
	 */
	public $groupManager;

	public function renderDefault($slug)
	{
		$group = $this->groupManager->getBySlug($slug);
		if (!$group) $this->error();
		$members = $this->groupManager->getMembers($group->id);

		$this->template->group = $group;
		$this->template->members = $members;
	}
}
