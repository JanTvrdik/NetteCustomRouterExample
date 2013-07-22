<?php
namespace App;

use Nette;
use Nette\Application\UI;


class EventsPresenter extends UI\Presenter
{
	/**
	 * @var EventManager
	 * @inject
	 */
	public $eventManager;

	public function renderDefault($slug)
	{
		$event = $this->eventManager->getBySlug($slug);
		if (!$event) $this->error();

		$this->template->event = $event;
	}
}
