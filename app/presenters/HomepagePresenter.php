<?php
namespace App;

use Nette;
use Nette\Application\UI;


class HomepagePresenter extends UI\Presenter
{
	/**
	 * @var UserManager
	 * @inject
	 */
	public $userManager;

	/**
	 * @var EventManager
	 * @inject
	 */
	public $eventManager;

	/**
	 * @var GroupManager
	 * @inject
	 */
	public $groupManager;

	public function renderDefault()
	{
		$this->template->users = $this->userManager->getAll();
		$this->template->events = $this->eventManager->getAll();
		$this->template->groups = $this->groupManager->getAll();
	}
}
